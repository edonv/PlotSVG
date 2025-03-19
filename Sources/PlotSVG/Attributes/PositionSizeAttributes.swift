//
//  PositionSizeAttributes.swift
//  PlotSVG
//
//  Created by Edon Valdman on 3/19/25.
//

import Foundation
import Plot

// MARK: SVGPositionableContext

public extension Attribute where Context: SVGPositionableContext {
    static func x(_ x: SVGLength) -> Attribute {
        Attribute(
            name: "x",
            value: x.rawValue
        )
    }
    
    static func y(_ y: SVGLength) -> Attribute {
        Attribute(
            name: "y",
            value: y.rawValue
        )
    }
}

public extension Node where Context: SVGPositionableContext {
    static func x(_ x: SVGLength) -> Node {
        .attribute(
            named: "x",
            value: x.rawValue
        )
    }
    
    static func y(_ y: SVGLength) -> Node {
        .attribute(
            named: "y",
            value: y.rawValue
        )
    }
}

// MARK: SVGSizeableContext

public extension Attribute where Context: SVGSizeableContext {
    static func width(_ width: SVGLength) -> Attribute {
        Attribute(
            name: "width",
            value: width.rawValue
        )
    }
    
    static func height(_ height: SVGLength) -> Attribute {
        Attribute(
            name: "height",
            value: height.rawValue
        )
    }
}

public extension Node where Context: SVGSizeableContext {
    static func width(_ width: SVGLength) -> Node {
        .attribute(
            named: "width",
            value: width.rawValue
        )
    }
    
    static func height(_ height: SVGLength) -> Node {
        .attribute(
            named: "height",
            value: height.rawValue
        )
    }
}
