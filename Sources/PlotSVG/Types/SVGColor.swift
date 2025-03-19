//
//  SVGColor.swift
//  PlotSVG
//
//  Created by Edon Valdman on 3/19/25.
//

import Foundation

/// A CSS2 compatible specification for a color in the [sRGB color space](https://www.w3.org/TR/SVG11/refs.html#ref-SRGB).
///
/// SVG supports all of the syntax alternatives for <color> defined in CSS2 syntax and basic data types, with the exception that SVG allows an expanded list of [recognized color keywords names](https://www.w3.org/TR/SVG11/types.html#ColorKeywords).
///
/// A `<color>` is either a keyword (see [Recognized color keyword names](https://www.w3.org/TR/SVG11/types.html#ColorKeywords) or a numerical RGB specification.
public struct SVGColor {
    public let rawValue: String
    
    public static func hex(_ string: String) -> SVGColor {
        return .init(rawValue: "#\(string)")
    }
    
    public static func hex(red: UInt8, green: UInt8, blue: UInt8) -> SVGColor {
        return .init(rawValue: "#\(String(format:"%02X", red))\(String(format:"%02X", green))\(String(format:"%02X", blue))")
    }
    
    public static func rgb(red: UInt8, green: UInt8, blue: UInt8) -> SVGColor {
        return .init(rawValue: "rgb(\(red),\(green),\(blue))")
    }
    
    public static func rgb(
        red: SVGPercentage,
        green: SVGPercentage,
        blue: SVGPercentage
    ) -> SVGColor {
        return .init(rawValue: "rgb(\([red, green, blue].map(\.rawValue).joined(separator: ",")))")
    }
    
    public static func rgb<F: BinaryFloatingPoint>(
        red: F,
        green: F,
        blue: F
    ) -> SVGColor {
        .rgb(
            red: .init(value: red),
            green: .init(value: green),
            blue: .init(value: blue)
        )
    }
    
    public static func literal(_ color: String) -> SVGColor {
        return .init(rawValue: color)
    }
}

extension SVGColor: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(rawValue: value)
    }
}
