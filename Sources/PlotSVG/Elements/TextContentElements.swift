//
//  TextContentElements.swift
//  PlotSVG
//
//  Created by Edon Valdman on 3/19/25.
//

import Foundation
import Plot

extension SVG.TextContext: SVGFillableContext, SVGStrokableContext {}

public extension Node where Context: SVGStructuralWithContentContext {
    /// Create a `<text>` element.
    static func text(_ nodes: Node<SVG.TextContext>...) -> Node {
        .element(named: "text", nodes: nodes)
    }
}
