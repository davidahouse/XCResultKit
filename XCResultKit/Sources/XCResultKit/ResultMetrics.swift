//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//- ResultMetrics
//    * Kind: object
//* Properties:
//+ analyzerWarningCount: Int
//+ errorCount: Int
//+ testsCount: Int
//+ testsFailedCount: Int
//+ warningCount: Int

import Foundation

struct ResultMetrics {
    let analyzerWarningCount: Int
    let errorCount: Int
    let testsCount: Int
    let testsFailedCount: Int
    let warningCount: Int
}
