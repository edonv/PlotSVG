//
//  SVGPaint.swift
//  PlotSVG
//
//  Created by Edon Valdman on 3/19/25.
//

import Foundation

public enum SVGPaint: RawRepresentable {
    case none
    case currentColor
    case color(SVGColor)
    
    public init(rawValue: String) {
        self = switch rawValue {
        case "none": .none
        case "currentColor": .currentColor
        default: .color(.init(rawValue: rawValue))
        }
    }
    
    public var rawValue: String {
        switch self {
        case .none: "none"
        case .currentColor: "currentColor"
        case .color(let color): color.rawValue
        }
    }
}
