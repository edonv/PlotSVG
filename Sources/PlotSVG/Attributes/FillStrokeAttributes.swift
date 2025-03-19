//
//  FillStrokeAttributes.swift
//  PlotSVG
//
//  Created by Edon Valdman on 3/19/25.
//

import Foundation
import Plot

// MARK: - SVGFillableContext

public extension Attribute where Context: SVGFillableContext {
    static func fill(_ paint: SVGPaint) -> Attribute {
        .attribute(named: "fill", value: paint.rawValue)
    }
    
    static func fillOpacity(_ opacity: CGFloat) -> Attribute {
        .attribute(
            named: "fill-opacity",
            value: "\(max(min(1, opacity), 0))"
        )
    }
    
    static func fillRule(_ rule: SVGFillRule) -> Attribute {
        .attribute(named: "fill-rule", value: rule.rawValue)
    }
}

public extension Node where Context: SVGFillableContext {
    static func fill(_ paint: SVGPaint) -> Node {
        .attribute(named: "fill", value: paint.rawValue)
    }
    
    static func fillOpacity(_ opacity: CGFloat) -> Node {
        .attribute(
            named: "fill-opacity",
            value: "\(max(min(1, opacity), 0))"
        )
    }
    
    static func fillRule(_ rule: SVGFillRule) -> Node {
        .attribute(named: "fill-rule", value: rule.rawValue)
    }
}

// MARK: - SVGStrokableContext

public extension Attribute where Context: SVGStrokableContext {
    static func stroke(_ paint: SVGPaint) -> Attribute {
        .attribute(named: "stroke", value: paint.rawValue)
    }
    
    // TODO: OR `inherit`
    static func strokeWidth(_ width: SVGPercentage) -> Attribute {
        .attribute(named: "stroke-width", value: width.rawValue)
    }
    
    static func strokeWidth(_ width: SVGLength) -> Attribute {
        .attribute(named: "stroke-width", value: width.rawValue)
    }
    
    static func strokeLineCap(_ lineCap: SVGLineCap) -> Attribute {
        .attribute(named: "stroke-linecap", value: lineCap.rawValue)
    }
    
    static func strokeLineJoin(_ lineJoin: SVGLineJoin) -> Attribute {
        .attribute(named: "stroke-linejoin", value: lineJoin.rawValue)
    }
    
    /// When two line segments meet at a sharp angle and miter joins have been specified for ‘stroke-linejoin’, it is possible for the miter to extend far beyond the thickness of the line stroking the path. The ‘stroke-miterlimit’ imposes a limit on the ratio of the miter length to the ‘stroke-width’. When the limit is exceeded, the join is converted from a miter to a bevel.
    ///
    /// The ratio of miter length (distance between the outer tip and the inner corner of the miter) to ‘stroke-width’ is directly related to the angle (theta) between the segments in user space by the formula:
    ///
    /// ```
    /// miterLength / stroke-width = 1 / sin ( theta / 2 )
    /// ```
    ///
    /// For example, a miter limit of 1.414 converts miters to bevels for theta less than 90 degrees, a limit of 4.0 converts them for theta less than approximately 29 degrees, and a limit of 10.0 converts them for theta less than approximately 11.5 degrees.
    /// - Parameter miterLimit: The limit on the ratio of the miter length to the ‘stroke-width’. The value must be greater than or equal to `1`.
    static func strokeMiterLimit(_ miterLimit: CGFloat) -> Attribute {
        .attribute(named: "stroke-miterlimit", value: "\(max(miterLimit, 1))")
    }
    
    // TODO: https://www.w3.org/TR/SVG11/painting.html#StrokeProperty
    // Make its own type
//    static func strokeDashArray(_ dashArray: [CGFloat]?) -> Attribute {
//        .attribute(
//            named: "stroke-dasharray",
//            value: dashArray
//                .map(String.init)
//                .joined(separator: <#T##String#>)
//        )
//    }
    
    // TODO: OR `inherit`
    static func strokeDashOffset(_ dashOffset: SVGPercentage) -> Attribute {
        .attribute(named: "stroke-dashoffset", value: dashOffset.rawValue)
    }
    
    static func strokeDashOffset(_ dashOffset: SVGLength) -> Attribute {
        .attribute(named: "stroke-dashoffset", value: dashOffset.rawValue)
    }
    
    static func strokeOpacity(_ opacity: CGFloat) -> Attribute {
        .attribute(
            named: "stroke-opacity",
            value: "\(max(min(1, opacity), 0))"
        )
    }
}

public extension Node where Context: SVGStrokableContext {
    static func stroke(_ paint: SVGPaint) -> Node {
        .attribute(named: "stroke", value: paint.rawValue)
    }
    
    // TODO: OR `inherit`
    static func strokeWidth(_ width: SVGPercentage) -> Node {
        .attribute(named: "stroke-width", value: width.rawValue)
    }
    
    static func strokeWidth(_ width: SVGLength) -> Node {
        .attribute(named: "stroke-width", value: width.rawValue)
    }
    
    static func strokeLineCap(_ lineCap: SVGLineCap) -> Node {
        .attribute(named: "stroke-linecap", value: lineCap.rawValue)
    }
    
    static func strokeLineJoin(_ lineJoin: SVGLineJoin) -> Node {
        .attribute(named: "stroke-linejoin", value: lineJoin.rawValue)
    }
    
    /// When two line segments meet at a sharp angle and miter joins have been specified for ‘stroke-linejoin’, it is possible for the miter to extend far beyond the thickness of the line stroking the path. The ‘stroke-miterlimit’ imposes a limit on the ratio of the miter length to the ‘stroke-width’. When the limit is exceeded, the join is converted from a miter to a bevel.
    ///
    /// The ratio of miter length (distance between the outer tip and the inner corner of the miter) to ‘stroke-width’ is directly related to the angle (theta) between the segments in user space by the formula:
    ///
    /// ```
    /// miterLength / stroke-width = 1 / sin ( theta / 2 )
    /// ```
    ///
    /// For example, a miter limit of 1.414 converts miters to bevels for theta less than 90 degrees, a limit of 4.0 converts them for theta less than approximately 29 degrees, and a limit of 10.0 converts them for theta less than approximately 11.5 degrees.
    /// - Parameter miterLimit: The limit on the ratio of the miter length to the ‘stroke-width’. The value must be greater than or equal to `1`.
    static func strokeMiterLimit(_ miterLimit: CGFloat) -> Node {
        .attribute(named: "stroke-miterlimit", value: "\(max(miterLimit, 1))")
    }
    
    // TODO: https://www.w3.org/TR/SVG11/painting.html#StrokeProperty
    // Make its own type
    //    static func strokeDashArray(_ dashArray: [CGFloat]?) -> Node {
    //        .attribute(
    //            named: "stroke-dasharray",
    //            value: dashArray
    //                .map(String.init)
    //                .joined(separator: <#T##String#>)
    //        )
    //    }
    
    // TODO: OR `inherit`
    static func strokeDashOffset(_ dashOffset: SVGPercentage) -> Node {
        .attribute(named: "stroke-dashoffset", value: dashOffset.rawValue)
    }
    
    static func strokeDashOffset(_ dashOffset: SVGLength) -> Node {
        .attribute(named: "stroke-dashoffset", value: dashOffset.rawValue)
    }
    
    static func strokeOpacity(_ opacity: CGFloat) -> Node {
        .attribute(
            named: "stroke-opacity",
            value: "\(max(min(1, opacity), 0))"
        )
    }
}
