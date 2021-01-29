//
//  File.swift
//  
//
//  Created by David House on 1/24/21.
//

import Foundation

import XCTest
@testable import XCResultKit

final class LogStoreManifestTests: XCTestCase {
    
    func testCanParseFromFile() throws {
        guard let data = testFile.data(using: .utf8) else {
            XCTFail("Error turning string into data, must not be a utf8 string")
            return
        }

        let manifest = try LogStoreManifest(data: data)
        XCTAssertEqual(manifest.executions.count, 1)
        XCTAssertEqual(manifest.executions[0].fileName, "Test-Copy of Stampede-2021.01.24_09-48-49--0500.xcresult")
    }
        
    let testFile = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>logFormatVersion</key>
        <integer>10</integer>
        <key>logs</key>
        <dict>
            <key>0EBE163A-644A-419D-92D8-957B0B912018</key>
            <dict>
                <key>auxiliaryLogUniqueIdentifier</key>
                <string>7665227E-8402-402D-9E86-2394DFAFD202</string>
                <key>auxiliaryObservable</key>
                <dict>
                    <key>highLevelStatus</key>
                    <string>W</string>
                </dict>
                <key>className</key>
                <string>IDESchemeActionsInvocationRecord</string>
                <key>documentTypeString</key>
                <string>&lt;nil&gt;</string>
                <key>domainType</key>
                <string>com.apple.dt.unit.cocoaUnitTest</string>
                <key>fileName</key>
                <string>Test-Copy of Stampede-2021.01.24_09-48-49--0500.xcresult</string>
                <key>hasAuxiliaryLog</key>
                <true/>
                <key>hasCoverageData</key>
                <true/>
                <key>hasPrimaryLog</key>
                <true/>
                <key>primaryObservable</key>
                <dict>
                    <key>highLevelStatus</key>
                    <string>E</string>
                </dict>
                <key>schemeIdentifier-containerName</key>
                <string>Stampede project</string>
                <key>schemeIdentifier-schemeName</key>
                <string>Copy of Stampede</string>
                <key>schemeIdentifier-sharedScheme</key>
                <integer>0</integer>
                <key>signature</key>
                <string>Test Copy of Stampede</string>
                <key>timeStartedRecording</key>
                <real>633192529.196661</real>
                <key>timeStoppedRecording</key>
                <real>0.0</real>
                <key>title</key>
                <string>Test Copy of Stampede</string>
                <key>uniqueIdentifier</key>
                <string>0EBE163A-644A-419D-92D8-957B0B912018</string>
            </dict>
        </dict>
    </dict>
    </plist>
    """
    
    let testFilePreviousVersion = """
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>logFormatVersion</key>
        <integer>9</integer>
    </dict>
    </plist>
    """
}
