//
//  SVGAttributes.swift
//  PlotSVG
//
//  Created by Edon Valdman on 3/1/25.
//

import Foundation
import Plot

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
internal let SVGNumberFormat = FloatingPointFormatStyle<Double>()
    .grouping(.never)
    .precision(.fractionLength(0...4))

public extension Attribute where Context == SVG.DeclarationContext {
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
