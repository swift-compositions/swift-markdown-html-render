import CSS_HTML_Layout_Rendering
import CSS_HTML_Rendering
import CSS_Theming
import HTML_Rendering


extension Markdown.Configuration.Directives {
    public struct Directive: Sendable {
        public let name: String
        public let rawArguments: String
        public let arguments: [String: String]
        public let children: HTML.AnyView

        public init(
            name: String,
            rawArguments: String,
            arguments: [String: String],
            children: HTML.AnyView
        ) {
            self.name = name
            self.rawArguments = rawArguments
            self.arguments = arguments
            self.children = children
        }
    }
}
