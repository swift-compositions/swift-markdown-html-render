import CSS_HTML_Layout_Rendering
import CSS_HTML_Rendering
import CSS_Theming
import HTML_Rendering


extension Markdown.Rendering.Image {
    public struct Input: Sendable {
        public let source: String?
        public let alt: String?
        public let title: String?

        public init(source: String?, alt: String?, title: String?) {
            self.source = source
            self.alt = alt
            self.title = title
        }
    }
}
