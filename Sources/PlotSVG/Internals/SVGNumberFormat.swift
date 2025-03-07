//
//  SVGNumberFormat.swift
//  PlotSVG
//
//  Created by Edon Valdman on 3/7/25.
//

import Foundation

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
internal let SVGNumberFormat = FloatingPointFormatStyle<Double>()
    .grouping(.never)
    .precision(.fractionLength(0...4))

internal let SVGNumberFormatter: NumberFormatter = {
    let f = NumberFormatter()
    f.usesGroupingSeparator = false
    f.minimumFractionDigits = 0
    f.maximumFractionDigits = 4
    return f
}()

internal func formatNumber(_ value: Double) -> String {
    if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
        "\(value.formatted(SVGNumberFormat))"
    } else {
        "\(SVGNumberFormatter.string(from: NSNumber(value: value))!)"
    }
}
