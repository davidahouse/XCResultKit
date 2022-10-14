//
//  File.swift
//  
//
//  Created by David House on 9/17/22.
//

import Foundation

//- ActionsInvocationMetadata
//   * Kind: object
//   * Properties:
//     + creatingWorkspaceFilePath: String
//     + uniqueIdentifier: String
//     + schemeIdentifier: EntityIdentifier?

public struct ActionsInvocationMetadata: XCResultObject {
    public let creatingWorkspaceFilePath: String
    public let uniqueIdentifier: String
    public let schemeIdentifier: EntityIdentifier?
    
    public init?(_ json: [String: AnyObject]) {
        
        do {
            creatingWorkspaceFilePath = try xcRequired(element: "creatingWorkspaceFilePath", from: json)
            uniqueIdentifier = try xcRequired(element: "uniqueIdentifier", from: json)
            schemeIdentifier = xcOptional(element: "schemeIdentifier", from: json)
        } catch {
            logError("Error parsing ActionsInvocationRecord: \(error.localizedDescription)")
            return nil
        }
    }
}
