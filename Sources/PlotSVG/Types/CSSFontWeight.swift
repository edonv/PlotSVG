//
//  CSSFontWeight.swift
//  PlotSVG
//
//  Created by Edon Valdman on 9/10/25.
//

import Foundation

public enum CSSFontWeight: RawRepresentable {
    case normal
    case bold
    case bolder
    case lighter
    case variable(Int)
    case other(String)
    
    public init(rawValue: String) {
        self = switch rawValue {
        case "normal": .normal
        case "bold": .bold
        case "bolder": .bolder
        case "lighter": .lighter
        default:
            if let int = Int(rawValue) {
                .variable(int)
            } else {
                .other(rawValue)
            }
        }
    }
    
    public var rawValue: String {
        switch self {
        case .normal: "normal"
        case .bold: "bold"
        case .bolder: "bolder"
        case .lighter: "lighter"
        case .variable(let int): "\(int)"
        case .other(let string): string
        }
    }
}
