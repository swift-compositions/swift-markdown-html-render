import HTML_Rendering


extension Markdown.Rendering.Table {
    public struct Input: Sendable {
        public let head: [Markdown.Rendering.Action]
        public let body: [Markdown.Rendering.Action]
        public let hasHead: Bool
        public let hasBody: Bool

        public init(
            head: [Markdown.Rendering.Action],
            body: [Markdown.Rendering.Action],
            hasHead: Bool,
            hasBody: Bool
        ) {
            self.head = head
            self.body = body
            self.hasHead = hasHead
            self.hasBody = hasBody
        }
    }
}
