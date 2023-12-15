//
//  ActionTestRepetitionPolicySummary.swift
//  
//
//  Created by Tyler Vick on 12/21/21.
//

import Foundation

public struct ActionTestRepetitionPolicySummary: XCResultObject {
    
    public let iteration: Int
    public let totalIterations: Int
    public let repetitionMode: RepetitionMode?
    
    public init?(_ json: [String: AnyObject]) {
        do {
            iteration = try xcRequired(element: "iteration", from: json)
            totalIterations = try xcRequired(element: "totalIterations", from: json)
            repetitionMode = RepetitionMode.from(xcOptional(element: "repetitionMode", from: json))
        } catch {
            logError("Error parsing \(String(describing: ActionTestRepetitionPolicySummary.self)): \(error.localizedDescription)")
            return nil
        }
    }

}

public enum RepetitionMode: String, Encodable {
    case none = "None"
    case runUntilFailure = "RunUntilFailure"
    case runRetryOnFailure = "RunRetryOnFailure"
    case upUntilMaximumRepetitions = "FixedIterations"
    
    static func from(_ str: String?) -> Self? {
        if let str = str {
            return self.init(rawValue: str)
        }
        return nil
    }
}
