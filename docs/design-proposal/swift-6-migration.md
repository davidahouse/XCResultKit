# Swift 6 migration: actors and structured concurrency

Status: Proposed (rev 2, incorporates design-proposal-reviewer feedback)

## Problem

Running XCResultKit from parallel jobs (several `XCResultFile` instances, or one shared across tasks) is unreliable. The package is on `swift-tools-version:5.1`, so no concurrency checking happens today. Swift 6 would flag most root causes at compile time.

## Findings

| # | Location | Issue | Impact |
|---|----------|-------|--------|
| 1 | `XCResultDate.swift:12` `public static var isoFormatter` | Global mutable, public `DateFormatter` used by every `Date.init?(_:)` | Swift 6 error. Data race on concurrent parsing. Callers can mutate the format. |
| 2 | `XCResultFile.swift` `private var isAtLeastXcode16: Bool?` | Lazy cache mutated in a getter on a non-`Sendable` class | Data race. Concurrent first calls each spawn `xcrun --version`. |
| 3 | `XCResultFile.swift` `xcrun(_:)` | Deprecated `launchPath`/`launch()`. Blocking read to EOF then `waitUntilExit`. stderr inherited. Launch failure raises an ObjC exception. | Blocks threads (including cooperative ones if called from `async`). Interleaved stderr across jobs. Crash if `xcrun` is missing. |
| 4 | `exportPayload(id:)` | Fixed path `NSTemporaryDirectory()/<id>`. Returns the URL even if export failed. | Parallel jobs overwrite each other. |
| 5 | `XCResultFile` is a non-`Sendable` `public class` | Cannot cross task boundaries | Blocks concurrent callers. |
| 6 | `TestExpression`, `TestValue`, `ActionTestSummaryGroup` (`public class`, only `let` properties) | Not `Sendable` | Parsed results cannot be returned from a task. |
| 7 | `LogStoreManifest` (internal class, `var executions`) | Mutated in `init` only | Not `Sendable`. Becomes a `let`. |
| 8 | `XCResultObject.init?(_ json: [String: AnyObject])` | `AnyObject` is not `Sendable` | Fine while JSON stays local to a synchronous `init`. Must never be stored or sent. |
| 9 | `CodingUserInfoKey.xcResultFile` | Force-unwrap without a comment. `XCResultFile` goes into `userInfo`. | Needs a justification comment. Needs `XCResultFile: Sendable`. |

Not an issue: `logError` is stateless and the schema structs are immutable.

## Target design

Mutable or I/O-bound state lives in actors. Everything the caller touches is value-like or `Sendable`. Fan-out uses structured concurrency (`async let`, `TaskGroup`). There are no unstructured `Task {}` and no `DispatchQueue`.

```
XCResultFile (final class, Sendable, let url, let tool)   <- public API, async
        |
        v
XCResultTool (actor)                                       <- owns xcrun access + version cache
        |
        v
ProcessRunner (struct, Sendable)                           <- one Process run, async, cancellable
```

### 1. `ProcessRunner` - async, cancellable, non-blocking

```swift
struct ProcessRunner: Sendable {
    func run(_ arguments: [String]) async throws -> Data { ... }
}
```

- `Process` is configured with `executableURL`, not `launchPath`.
- Use `Process.run()` in a `do/catch`. A launch failure becomes a Swift error (`XCResultError.toolLaunchFailed`).
- Completion is bridged with `withTaskCancellationHandler` + `withCheckedThrowingContinuation` on `terminationHandler`. It does **not** call `waitUntilExit`, so no cooperative thread is blocked.
- Cancelling the task terminates the process. This is the main benefit of structured concurrency here.
- stdout is drained with `FileHandle.bytes` / `readToEnd` on a child task. stderr goes to `FileHandle.nullDevice`. This is a deliberate choice: capturing stderr would need a second concurrent drain to avoid pipe-buffer deadlock. Add it only when error messages are needed.
- The non-zero exit status becomes a thrown error. The old `.onlyOnSuccess/.never` modes collapse into: `nil`-returning sync wrappers (deprecated) and throwing async ones.

### 2. `XCResultTool` actor - single owner of shared state

```swift
actor XCResultTool {
    private var legacyFlag: Task<Bool, Never>?      // single-flight cache
    func data(_ args: [String]) async throws -> Data   // appends --legacy when needed
}
```

- Caches the Xcode >= 16 check in one `Task`, so concurrent first callers await the same result and `xcrun --version` runs once. This is the single-flight pattern. A plain `Bool?` would let a second caller re-run the check across the `await` (actor reentrancy).
- Alternative considered: a process-wide `static let`. It is simpler, but it cannot be injected and it runs a blocking process in the initializer. The actor keeps the dependency injectable for tests (`ProcessRunner` can be swapped).
- A shared instance is the default, so all `XCResultFile`s in one process share one version check.

### 3. `XCResultFile` - Sendable facade with async API

```swift
public final class XCResultFile: Sendable {
    public let url: URL
    private let tool: XCResultTool
    public init(url: URL) { self.init(url: url, tool: .shared) }

    public func getInvocationRecord() async throws -> ActionsInvocationRecord
    public func getActionTestSummary(id: String) async throws -> ActionTestSummary
    ...
}
```

- The class has only `let` state, so it is trivially `Sendable`. It does not need to become an actor, because it holds no mutable state.
- The existing sync, optional-returning methods stay for one release, marked `@available(*, deprecated, message: "Use the async variant")`. They are implemented with a blocking bridge only if needed. Otherwise they are removed in 2.0.
- JSON parsing (`JSONSerialization` + `XCResultObject.init?`) runs synchronously after the `await`, off any actor, and returns `Sendable` values.
- Fan-out helper with structured concurrency, for the common "load many summaries" use:

```swift
public func getActionTestSummaries(ids: [String]) async throws -> [ActionTestSummary] {
    try await withThrowingTaskGroup(of: (Int, ActionTestSummary).self) { group in
        for (index, id) in ids.enumerated() {
            group.addTask { (index, try await self.getActionTestSummary(id: id)) }
        }
        var results = [ActionTestSummary?](repeating: nil, count: ids.count)
        for try await (index, summary) in group { results[index] = summary }
        return results.compactMap { $0 }
    }
}
```

  Concurrency is bounded by a limit (default `ProcessInfo.activeProcessorCount`) by adding tasks incrementally. Spawning one `xcrun` per id without a cap would overload the machine.
- `exportPayload(id:)` becomes `async throws -> URL`. It writes to a fresh `temporaryDirectory/<UUID>/<id>`, throws if the file is missing, and the caller owns cleanup. This is documented as a behaviour change.

### 4. Date parsing

Remove the shared formatter. Parse with a formatter created per call (no shared state). Switch to `ISO8601DateFormatter` only after the fixtures prove `+0000` offsets and fractional seconds parse identically. `isoFormatter` is deprecated first (returns a fresh formatter each access) and removed in 2.0.

### 5. Value types

- `TestExpression`, `TestValue`, `ActionTestSummaryGroup`: `public final class ...: Sendable` (`let` properties of `Sendable` types).
- `XCResultObject: Encodable, Sendable`. This is source-breaking for external conformers, so it ships in 2.0.
- `LogStoreManifest`: local array, assigned once to a `let`.

## Rollout

### Phase 0 - preparatory commits (no behaviour change, no API change)

Each is a separate commit so the later diffs only contain the real migration. They are mergeable on their own.

1. `chore: bump swift-tools-version to 5.9` - `Package.swift` only. Keep `.macOS(.v10_15)`. Confirms the toolchain floor before anything else depends on it.
2. `ci: add macOS and Linux build + test jobs` - there is no `.github/workflows` today, so the Linux support from `feature/run-on-linux` is unguarded. Add one job per platform that runs `swift build` and `swift test`.
3. `test: add concurrency stress test` - N concurrent `getInvocationRecord()` calls and date parses over `TestResources`, asserting identical results. Run it under `swift test --sanitize=thread`. It must **fail on `main`**. It is the evidence for the Problem section and the acceptance test for phase 1. Mark it as an expected failure, or skip it in the default CI job, until phase 1 lands.
4. `chore: enable StrictConcurrency=complete` - `swiftSettings: [.enableExperimentalFeature("StrictConcurrency")]`. Warnings only, no code change. Commit the warning count (or list) in the PR description as the burn-down baseline.
5. `refactor: justify force-unwrap on CodingUserInfoKey` - comment only (finding 9).

`swift test --parallel` does not reproduce these races, since it uses separate processes. Only the stress test with TSan does.

### Phases 1-3

| Phase | Content | Tools / language mode | Release |
|-------|---------|-----------------------|---------|
| 1 | `ProcessRunner`, `XCResultTool` actor, async API, date formatter, export path. Sync API deprecated. The stress test must now pass. | tools 5.9, Swift 5 mode, `StrictConcurrency=complete` | minor |
| 2 | `Sendable` on types, `XCResultObject: Sendable`, remove deprecated sync API and `isoFormatter` | same | 2.0 |
| 3 | Flip to Swift 6 language mode (`swift-tools-version:6.0`, `.swiftLanguageMode(.v6)`) | tools 6.0 | 2.0 or 2.x |

Platforms: Swift concurrency back-deploys to macOS 10.15, so `.macOS(.v10_15)` can stay on tools 5.9+. Avoid APIs that need newer OS versions (for example `Date.ISO8601FormatStyle`, macOS 12). Verify `FileHandle.bytes` availability. Fall back to `readToEnd` on a child task if needed.

Linux (`feature/run-on-linux`): `xcrun` is Apple-only. `executableURL` + `do/catch` must compile on `swift-corelibs-foundation`, and a missing `/usr/bin/xcrun` becomes a thrown error rather than a crash. Confirm in Linux CI.

## Not doing

- Moving tests to Swift Testing: unrelated to the goal. The tests stay on XCTest, with async tests added.
- Making `XCResultFile` an actor: it has no mutable state to protect.
- Returning to Combine or callbacks.
- stderr capture (see ProcessRunner).

## Risks

| Risk | Mitigation |
|------|------------|
| Breaking API (async, `throws`, `final`) | Deprecate the old API for one minor, remove in 2.0. Document in the changelog. |
| Actor reentrancy in the version cache | Single-flight `Task` stored before the first `await`. Covered by the stress test. |
| Unbounded process fan-out | Cap the group width. |
| Fresh `DateFormatter` per parse is slow on large logs | Measure on `ActivityLogTests` fixtures. Move to `ISO8601DateFormatter` if compatible. |
| Consumers on older toolchains | Phases 1-2 need tools 5.9 only. Only phase 3 needs Swift 6. State the minimum toolchain in the README. |

## Open questions

1. Is a 2.0 acceptable, with the sync API and `isoFormatter` removed?
2. Is the default concurrency cap (`activeProcessorCount`) right for CI, or should it be configurable?
3. Should phase 3 (Swift 6 mode) ship in 2.0 or later?

## Verification

- The TSan stress test passes: `swift test --sanitize=thread`.
- Zero warnings with `-strict-concurrency=complete`.
- `exportRecursiveJson()` output is byte-identical before and after on all fixtures.
- A cancellation test: cancelling a task kills the child `xcrun` process.
