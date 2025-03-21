//
//  SVGElements.swift
//  PlotSVG
//
//  Created by Edon Valdman on 2/25/25.
//

import Foundation
import Plot

// MARK: - Root

public extension Element where Context == SVG.RootContext {
    /// Add an XML `<xml>` element to the document.
    ///
    /// Example:
    /// ```xml
    /// <?xml version="1.0" standalone="yes"?>
    /// ```
    ///
    /// You typically never have to call this API yourself, since Plot
    /// will automatically add this declaration at the top of all SVG
    /// documents that are created using the `SVG` type's initializer.
    static func xmlHeader(standalone: Bool? = nil) -> Element {
        .xml(
            .version(1.0),
            .init(
                name: "standalone",
                value: standalone
                    .map { $0 ? "yes" : "no" },
                ignoreIfValueIsEmpty: true
            )
        )
    }
    
    /// Add a root `<svg>` element to the document.
    /// 
    /// You typically never have to call this API yourself, since Plot
    /// will automatically add this element at the root of all SVG
    /// documents that are created using the `SVG` type's initializer.
    /// - parameter nodes: The element's attributes and child elements.
    static func svg(
        attributes: [Attribute<SVG.DocumentContext>] = [],
        _ nodes: Node<SVG.DocumentContext>...
    ) -> Element {
        let attrs: [Attribute<Any>] = [
            .attribute(named: "xmlns", value: "http://www.w3.org/2000/svg"),
            .attribute(named: "version", value: "1.1"),
        ]
        
        return .named(
            "svg",
            nodes: attrs.map(\.node)
            + attributes.map {
                $0.node.convertToNode(withContext: Any.self)
            }
            + nodes.map {
                $0.node.convertToNode(withContext: Any.self)
            }
        )
    }
}
