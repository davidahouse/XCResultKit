//
//  File.swift
//  
//
//  Created by David House on 9/17/22.
//

import Foundation

//- EntityIdentifier
//  * Kind: object
//  * Properties:
//    + entityName: String
//    + containerName: String
//    + entityType: String
//    + sharedState: String

public struct EntityIdentifier: XCResultObject {
    public let entityName: String
    public let containerName: String
    public let entityType: String
    public let sharedState: String
    
    public init?(_ json: [String: AnyObject]) {
        
        do {
            entityName = try xcRequired(element: "entityName", from: json)
            containerName = try xcRequired(element: "containerName", from: json)
            entityType = try xcRequired(element: "entityType", from: json)
            sharedState = try xcRequired(element: "sharedState", from: json)
        } catch {
            logError("Error parsing DocumentLocation: \(error.localizedDescription)")
            return nil
        }
    }
}
