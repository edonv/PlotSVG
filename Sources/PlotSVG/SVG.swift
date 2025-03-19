//
//  SVG.swift
//  PlotSVG
//
//  Created by Edon Valdman on 2/25/25.
//

import Foundation
import Plot

public struct SVG: DocumentFormat {
    private let document: Document<SVG>
    
    // Create an HTML document with a collection of nodes that make
    // up its elements and attributes. Start by specifying its root
    // nodes, such as `.head()` and `.body()`, and then create any
    // sort of hierarchy of elements and attributes from there.
    // - parameter nodes: The root nodes of the document, which will
    // be placed inside of an `<html>` element.
    public init(
        attributes: [Attribute<SVG.DocumentContext>] = [],
        _ nodes: Node<SVG.DocumentContext>...
    ) {
        document = Document<SVG>.custom(
            .xmlHeader(),
            .svg(
                attributes: attributes,
                .group(nodes)
            )
        )
    }
    
    public init(
        attributes: [Attribute<SVG.DocumentContext>] = [],
        _ nodes: [Node<SVG.DocumentContext>]
    ) {
        document = Document<SVG>.custom(
            .xmlHeader(),
            .svg(
                attributes: attributes,
                .group(nodes)
            )
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
    enum RootContext: XMLRootContext {}
    /// The context within an SVG document's `<svg>` declaration.
    enum DeclarationContext {}
    /// The user-facing root context of an SVG document. (i.e. inside the root `<svg>` element)
    final class DocumentContext: SVGElementContext {}
    
    /// Used for nested `<svg>` elements.
    class SVGElementContext: SVGContainerContext, SVGStructuralWithContentContext, SVGPositionableContext, SVGSizeableContext {}
    
    enum AnchorContext: SVGContainerContext {}
    enum CircleContext: SVGShapeContext, SVGFillableContext, SVGStrokableContext {}
    enum DefsContext: SVGContainerContext, SVGStructuralWithContentContext {}
    enum EllipseContext: SVGShapeContext, SVGFillableContext, SVGStrokableContext {}
    enum GlyphContext: SVGContainerContext {}
    enum GroupContext: SVGContainerContext, SVGStructuralWithContentContext {}
    enum ImageContext: SVGGraphicsContext {}
    enum LineContext: SVGShapeContext, SVGStrokableContext {}
    enum MarkerContext: SVGContainerContext {}
    enum MaskContext: SVGContainerContext {}
    enum MissingGlyphContext: SVGContainerContext {}
    enum PathContext: SVGShapeContext, SVGFillableContext, SVGStrokableContext {}
    enum PatternContext: SVGContainerContext {}
    enum PolygonContext: SVGShapeContext, SVGFillableContext, SVGStrokableContext {}
    enum PolylineContext: SVGShapeContext, SVGFillableContext, SVGStrokableContext {}
    enum RectContext: SVGShapeContext, SVGFillableContext, SVGStrokableContext {}
    enum SwitchContext: SVGContainerContext {}
    enum SymbolContext: SVGContainerContext, SVGStructuralWithContentContext {}
    enum TextContext: SVGGraphicsContext, SVGAnimatableContext, SVGDescribableContext {}
    enum UseContext: SVGGraphicsContext, SVGStructuralContext {}
}

/// Protocol adopted by all contexts that are at the root level of
/// an SVG-based document format.
public protocol SVGContext {}

// MARK: - SVG Spec Category Contexts

/// An element which can contain elements in the `animation` category.
public protocol SVGAnimatableContext: SVGContext {}

/// Context shared among all SVG elements belonging to the `shape` category (`circle`, `ellipse`, `line`, `path`, `polygon`, `polyline` and `rect`).
public protocol SVGShapeContext: SVGAnimatableContext, SVGGraphicsContext {}

/// An element which can have graphics elements and other container elements as child elements.
///
/// Specifically: `a`, `defs`, `glyph`, `g`, `marker`, `mask`, `missing-glyph`, `pattern`, `svg`, `switch` and `symbol`.
public protocol SVGContainerContext: SVGDescribableContext {}

/// One of the element types that can cause graphics to be drawn onto the target canvas.
///
/// Specifically: `circle`, `ellipse`, `image`, `line`, `path`, `polygon`, `polyline`, `rect`, `text` and `use`.
public protocol SVGGraphicsContext: SVGDescribableContext {}

/// A text content element is an SVG element that causes a text string to be rendered onto the canvas: `altGlyph`, `textPath`, `text`, and `tspan`.
public protocol SVGTextContentContext: SVGFillableContext, SVGStrokableContext {}

/// A text content child element is a ``SVGTextContentContext`` element that is allowed as a descendant of another ``SVGTextContentContext`` element: `altGlyph`, `textPath`, and `tspan`.
public protocol SVGTextContentChildContext: SVGTextContentContext {}

/// The structural elements are those which define the primary structure of an SVG document.
///
/// Specifically, the following elements are structural elements: `defs`, `g`, `svg`, `symbol` and `use`.
public protocol SVGStructuralContext: SVGDescribableContext {}

// MARK: - Extension Contexts

/// Context shared among all SVG elements that can be styled by external CSS through the `class` attribute`.
public protocol SVGClassableContext: SVGContext {}

/// Context shared among all SVG elements that can be styled using inline CSS through the `style` attribute`.
public protocol SVGStylableContext: SVGContext {}

/// Context shared among all SVG elements that can use the `fill` attribute.
public protocol SVGFillableContext: SVGContext {}

/// Context shared among all SVG elements that can use the `stroke` attribute.
public protocol SVGStrokableContext: SVGFillableContext {}

/// Same as ``SVGStructuralContext``, except without `use`.
///
/// This is used for elements that can have normal elements in them, which `use` cannot.
public protocol SVGStructuralWithContentContext: SVGStructuralContext {}

/// Context shared among all SVG elements that can use the `x`/`y` attributes.
public protocol SVGPositionableContext: SVGContext {}

/// Context shared among all SVG elements that can use the `width`/`height` attributes.
public protocol SVGSizeableContext: SVGContext {}
