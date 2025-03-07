//
//  PlotSVG.swift
//  PlotSVG
//
//  Created by Edon Valdman on 2/25/25.
//

import Foundation
import Plot

public struct SVG: DocumentFormat {
    private let document: Document<SVG>
    
    /// Create an HTML document with a collection of nodes that make
    /// up its elements and attributes. Start by specifying its root
    /// nodes, such as `.head()` and `.body()`, and then create any
    /// sort of hierarchy of elements and attributes from there.
    /// - parameter nodes: The root nodes of the document, which will
    /// be placed inside of an `<html>` element.
    public init(
        svgAttrs: [Attribute<SVG.DeclarationContext>],
        _ nodes: [Node<SVG.DocumentContext>]
    ) {
        document = Document<SVG>.custom(
            .xml(
                .version(1.0)
            ),
            .svg(svgAttrs: svgAttrs, nodes)
        )
    }
    
    public func render() -> String {
        self.document.render()
    }
    
    public func render(indentedBy indentationKind: Indentation.Kind?) -> String {
        self.document.render(indentedBy: indentationKind)
    }
}

public extension SVG {
    /// The root context of an SVG document.
    enum RootContext: SVGContext {}
    /// The context within an SVG document's `<svg>` declaration.
    enum DeclarationContext {}
    /// The user-facing root context of an SVG document.
    enum DocumentContext {}
}

/// Protocol adopted by all contexts that are at the root level of
/// an SVG-based document format.
public protocol SVGContext: XMLRootContext {}

extension Element where Context: SVGContext {
    static func svg(
        svgAttrs: [Attribute<SVG.DeclarationContext>],
        _ nodes: [Node<SVG.DocumentContext>]
    ) -> Element<Context> {
        Element<Context>.named(
            "svg",
            nodes: [
                .attribute(named: "xmlns", value: "http://www.w3.org/2000/svg"),
                .attribute(named: "version", value: "1.1"),
            ] + svgAttrs.map {
                .attribute(named: $0.name, value: $0.value)
            }
            + nodes.map {
                $0.node.convertToNode(withContext: Any.self)
            }
        )
    }
}
