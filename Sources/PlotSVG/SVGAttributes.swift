//
//  SVGAttributes.swift
//  PlotSVG
//
//  Created by Edon Valdman on 3/1/25.
//

import Foundation
import Plot

public extension Attribute where Context == SVG.DocumentContext {
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
    
    static func preserveAspectRatio(
        _ option: PreserveAspectRatio.Options,
        meetOrSlice: PreserveAspectRatio.MeetSlice?
    ) -> Attribute {
        return Attribute(
            name: "preserveAspectRatio",
            value: PreserveAspectRatio(
                option: option,
                meetOrSlice: meetOrSlice
            ).rawValue
        )
    }
    
    static func viewBox(
        minX: Double = 0,
        minY: Double = 0,
        width: Double,
        height: Double
    ) -> Attribute {
        Attribute(
            name: "viewBox",
            value: [minX, minY, width, height]
                .map { String($0) }
                .joined(separator: " ")
        )
    }
}

public extension Node where Context: SVGClassableContext {
    static func `class`(_ className: String...) -> Node {
        .attribute(named: "class", value: className.joined(separator: " "))
    }
}

public extension Attribute where Context: SVGClassableContext {
    static func `class`(_ className: String...) -> Attribute {
        .attribute(named: "class", value: className.joined(separator: " "))
    }
}

public extension Node where Context: SVGStylableContext {
    static func style(_ css: String) -> Node {
        .attribute(named: "style", value: css)
    }
}

public extension Attribute where Context: SVGStylableContext {
    static func style(_ css: String) -> Attribute {
        .attribute(named: "style", value: css)
    }
}
