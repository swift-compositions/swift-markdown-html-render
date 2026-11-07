import CSS_HTML_Rendering
import HTML_Rendering


extension Markdown.Rendering.Link {
    public struct Input: Sendable {
        public let destination: String?
        public let title: String?
        public let children: [Markdown.Rendering.Action]

        public init(destination: String?, title: String?, children: [Markdown.Rendering.Action]) {
            self.destination = destination
            self.title = title
            self.children = children
        }
    }
}
