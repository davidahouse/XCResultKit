//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//  Version: 3.19
//
//  - Reference
//      * Kind: object
//      * Properties:
//      + id: String
//      + targetType: TypeDefinition?

import Foundation

public struct Reference<TargetResultObject: XCResultObject>: XCResultObject {
    public let id: String
    public let targetType: TypeDefinition?
    
    public init?(_ json: [String: AnyObject]) {
        
        do {
            id = try xcRequired(element: "id", from: json)
            targetType = xcOptional(element: "targetType", from: json)
        } catch {
            logError("Error parsing Reference: \(error.localizedDescription)")
            return nil
        }
    }

    enum CodingKeys: CodingKey {
        case id
        case targetType
        case referencedObject
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.targetType, forKey: .targetType)
        
        if let xcResultFile = encoder.userInfo[.xcResultFile] as? XCResultFile {
            let referencedObject = getReferencedObject(file: xcResultFile)
            try container.encodeIfPresent(referencedObject, forKey: .referencedObject)
        }
    }

    private func getReferencedObject(file: XCResultFile) -> TargetResultObject? {
        guard let rootJson = file.getRootJson(id: id) else {
            logError("Unable to retrieve json from file: \(file.url) with id: \(id) for expected type: \(TargetResultObject.self)")
            return nil
        }

        return TargetResultObject(rootJson)
    }

}
