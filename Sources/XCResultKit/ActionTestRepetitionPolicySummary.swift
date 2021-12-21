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
    public let repetitionMode: RepetitionMode
    
    public init?(_ json: [String: AnyObject]) {
        do {
            iteration = try xcRequired(element: "iteration", from: json)
            totalIterations = try xcRequired(element: "totalIterations", from: json)
            repetitionMode = RepetitionMode(rawValue: try xcRequired(element: "repetitionMode", from: json))!
        } catch {
            logError("Error parsing \(String(describing: ActionTestRepetitionPolicySummary.self)): \(error.localizedDescription)")
            return nil
        }
    }

}

public enum RepetitionMode: String {
    case runRetryOnFailure = "RunRetryOnFailure"
}
