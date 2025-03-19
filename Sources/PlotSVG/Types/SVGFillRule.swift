//
//  SVGFillRule.swift
//  PlotSVG
//
//  Created by Edon Valdman on 3/19/25.
//

import Foundation

/// https://www.w3.org/TR/SVG11/painting.html#FillRuleProperty
public enum SVGFillRule: String {
    case nonzero
    case evenodd
}
