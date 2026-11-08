
extension Markdown.Rendering.Text {
    public struct Input: Sendable {
        public let text: String

        public init(text: String) {
            self.text = text
        }
    }
}
