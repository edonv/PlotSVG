//
//  SVGPercentage.swift
//  PlotSVG
//
//  Created by Edon Valdman on 3/19/25.
//

import Foundation

/// A value between `0.0` and `1.0` as a percentage.
public struct SVGPercentage: RawRepresentable {
    public let value: CGFloat
    
    public var rawValue: String {
        "\(value * 100)%"
    }
    
    public init<F: BinaryFloatingPoint>(value: F) {
        self.value = max(min(1, CGFloat(value)), 0)
    }
    
    public init?(rawValue: String) {
        guard rawValue.hasSuffix("%"),
              let d = Double(rawValue.dropLast()) else {
            return nil
        }
        
        self.init(value: d)
    }
}

extension SVGPercentage: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self.init(value: value)
    }
}
