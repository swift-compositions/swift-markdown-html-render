import CSS_HTML_Rendering
import CSS_Theming
import HTML_Rendering


extension Markdown.Configuration.Style {
    public struct DiagnosticStyle: Sendable {
        public var level: @Sendable (_ name: String) -> Markdown.Diagnostic.Level?

        public init(_ level: @escaping @Sendable (_ name: String) -> Markdown.Diagnostic.Level?) {
            self.level = level
        }
    }
}
