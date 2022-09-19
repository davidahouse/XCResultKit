//
//  File.swift
//  
//
//  Created by David House on 9/17/22.
//

import Foundation

//- ConsoleLogSection
//   * Kind: object
//   * Properties:
//     + title: String
//     + items: [ConsoleLogItem]

public struct ConsoleLogSection: XCResultObject {
    public let title: String
    public let items: [ConsoleLogItem]
    
    public init?(_ json: [String: AnyObject]) {
        do {
            title = try xcRequired(element: "title", from: json)
            items = xcArray(element: "items", from: json).ofType(ConsoleLogItem.self)
        } catch {
            logError("Error parsing ConsoleLogSection: \(error.localizedDescription)")
            return nil
        }
    }
}
