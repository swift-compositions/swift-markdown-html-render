import CSS_HTML_Layout_Rendering
import CSS_HTML_Rendering
import CSS_Theming
import HTML_Rendering
@_spi(DynamicHTML) import HTML_Rendering_Core
import SwiftMarkdown


extension Markdown.Rendering.BlockQuote {
    public struct Input: Sendable {
        public let kind: String
        public let children: [Markdown.Rendering.Action]
        public let isDiagnostic: Bool
        public let diagnosticLevel: Markdown.Diagnostic.Level?

        public init(
            kind: String,
            children: [Markdown.Rendering.Action],
            isDiagnostic: Bool,
            diagnosticLevel: Markdown.Diagnostic.Level?
        ) {
            self.kind = kind
            self.children = children
            self.isDiagnostic = isDiagnostic
            self.diagnosticLevel = diagnosticLevel
        }
    }
}
