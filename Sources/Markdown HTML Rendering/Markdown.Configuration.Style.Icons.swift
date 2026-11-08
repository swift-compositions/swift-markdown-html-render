import CSS_HTML_Rendering
import CSS_Theming
import HTML_Rendering


extension Markdown.Configuration.Style {
    public struct Icons: Sendable {
        public var link: @Sendable () -> HTML.AnyView
        public var diagnostic: @Sendable (DiagnosticIconKind) -> HTML.AnyView

        public init(
            link: @escaping @Sendable () -> HTML.AnyView,
            diagnostic: @escaping @Sendable (DiagnosticIconKind) -> HTML.AnyView
        ) {
            self.link = link
            self.diagnostic = diagnostic
        }
    }
}
