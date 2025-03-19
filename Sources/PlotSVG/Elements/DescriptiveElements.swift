//
//  DescriptiveElements.swift
//  PlotSVG
//
//  Created by Edon Valdman on 3/10/25.
//

import Foundation
import Plot

/// Context shared among all SVG elements that can contain elements in the `Descriptive elements` category (`<desc>` or `<title>`).
public protocol SVGDescribableContext: SVGContext {}

public extension Element where Context: SVGDescribableContext {
    /// The `<desc>` SVG element provides an accessible, long-text description of any SVG `container element` or `graphics element`.
    ///
    /// Text in a `<desc>` element is not rendered as part of the graphic. If the element can be described by visible text, it is possible to reference that text with the aria-describedby attribute. If aria-describedby is used, it will take precedence over `<desc>`.
    ///
    /// The hidden text of a `<desc>` element can also be concatenated with the visible text of other elements using multiple IDs in an aria-describedby value. In that case, the <desc> element must provide an ID for reference.
    /// - Parameter description: <#description description#>
    static func desc(_ description: String) -> Element {
        .named("desc", nodes: [.text(description)])
    }
    
    /// The `<title>` SVG element provides an accessible, short-text description of any SVG container element or graphics element.
    ///
    /// Text in a `<title>` element is not rendered as part of the graphic, but browsers usually display it as a tooltip. If an element can be described by visible text, it is recommended to reference that text with an `aria-labelledby` attribute rather than using the `<title>` element.
    ///
    /// > Note: For backward compatibility with SVG 1.1, `<title>` elements should be the first child element of their parent.
    /// - Parameter title: <#title description#>
    static func title(_ title: String) -> Element {
        .named("title", nodes: [.text(title)])
    }
}

public extension Node where Context: SVGDescribableContext {
    /// The `<desc>` SVG element provides an accessible, long-text description of any SVG `container element` or `graphics element`.
    ///
    /// Text in a `<desc>` element is not rendered as part of the graphic. If the element can be described by visible text, it is possible to reference that text with the aria-describedby attribute. If aria-describedby is used, it will take precedence over `<desc>`.
    ///
    /// The hidden text of a `<desc>` element can also be concatenated with the visible text of other elements using multiple IDs in an aria-describedby value. In that case, the <desc> element must provide an ID for reference.
    /// - Parameter description: <#description description#>
    static func desc(_ description: String) -> Node {
        .element(named: "desc", text: description)
    }
    
    /// The `<title>` SVG element provides an accessible, short-text description of any SVG container element or graphics element.
    ///
    /// Text in a `<title>` element is not rendered as part of the graphic, but browsers usually display it as a tooltip. If an element can be described by visible text, it is recommended to reference that text with an `aria-labelledby` attribute rather than using the `<title>` element.
    ///
    /// > Note: For backward compatibility with SVG 1.1, `<title>` elements should be the first child element of their parent.
    /// - Parameter title: <#title description#>
    static func title(_ title: String) -> Node {
        .element(named: "title", text: title)
    }
}
