//
//  SVGAttributes.swift
//  PlotSVG
//
//  Created by Edon Valdman on 3/1/25.
//

import Foundation
import Plot

public extension Attribute where Context == SVG.DocumentContext {
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
    
    static func viewBox<F: BinaryFloatingPoint>(
        minX: F = 0,
        minY: F = 0,
        width: F,
        height: F
    ) -> Attribute {
        Attribute(
            name: "viewBox",
            value: [minX, minY, width, height]
                .map { Double($0) }
                .map { String($0) }
                .joined(separator: " ")
        )
    }
}

public extension Node where Context == SVG.DocumentContext {
    static func preserveAspectRatio(
        _ option: PreserveAspectRatio.Options,
        meetOrSlice: PreserveAspectRatio.MeetSlice?
    ) -> Node {
        return .attribute(
            named: "preserveAspectRatio",
            value: PreserveAspectRatio(
                option: option,
                meetOrSlice: meetOrSlice
            ).rawValue
        )
    }
    
    static func viewBox<F: BinaryFloatingPoint>(
        minX: F = 0,
        minY: F = 0,
        width: F,
        height: F
    ) -> Node {
        .attribute(
            named: "viewBox",
            value: [minX, minY, width, height]
                .map { Double($0) }
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
