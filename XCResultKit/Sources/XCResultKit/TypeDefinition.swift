//
//  File.swift
//  
//
//  Created by David House on 6/30/19.
//
//  - TypeDefinition
//      * Kind: object
//      * Properties:
//      + name: String
//      + supertype: TypeDefinition?

import Foundation

enum TypeDefinition {
    case root(String)
    indirect case subtype(String, TypeDefinition)
}
