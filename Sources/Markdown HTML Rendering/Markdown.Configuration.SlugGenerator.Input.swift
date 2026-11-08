import CSS_HTML_Rendering
import CSS_Theming
import HTML_Rendering


extension Markdown.Configuration.SlugGenerator {
    public struct Input: Sendable {
        public let text: String
        public let existingSlugs: Swift.Set<String>

        public init(text: String, existingSlugs: Swift.Set<String>) {
            self.text = text
            self.existingSlugs = existingSlugs
        }
    }
}
