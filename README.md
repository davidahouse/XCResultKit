# XCResultKit

This package provides some friendly `Swift` objects that map to the `xcresult` objects that you can
access using the `xcresulttool` and `xccov` apps included in `Xcode 11`. Both of these apps provide
export to JSON options, and this package provides all the JSON parsing required to turn the data into
objects you can use.

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdavidahouse%2FXCResultKit%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/davidahouse/XCResultKit)

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fdavidahouse%2FXCResultKit%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/davidahouse/XCResultKit)

## XCResultFile

This is the main entry point for using the package. Just create an instance of this object with the path
to the `.xcresult` you want to extract from:

```
let resultFile = XCResultFile(url: urlToXCResult)
```

Once you have created an instance, there are several methods to extract and parse the data. Note that these
all shell out to run the `xcresulttool` or `xccov` so clearly this will not work on anything but `macOS`.

To get the `ActionsInvocationRecord` object (this is the top level object in the `.xcresult` file):

```
let invocationRecord = resultFile.getInvocationRecord()
```

Inside the invocation record you will find test plan run summaries id which you can use to get the details of what tests were ran:

```
let testPlanRunSummaries = resultFile.getTestPlanRunSummaries(id: "xxx")
```

You can get the details for an individual test:

```
let testSummary = resultFile.getActionTestSummary(id: "xxx")
```

Tests can also include attachments and with the payload ID you can either get the raw data, or export the contents to a file:

```
let payload = resultFile.getPayload(id: "123")
let exportedPath = resultFile.exportPayload(id: "123")
```

And you can also get the results of `xccov` using this simplified method:

```
let codeCoverage = resultFile.getCodeCoverage()
```
