extension Markdown.Rendering {
    public struct Text: Sendable {
        public var render: @Sendable (Input) -> [Renderer.Document.Action]

        public init(render: @escaping @Sendable (Input) -> [Renderer.Document.Action]) {
            self.render = render
        }
    }
}

extension Markdown.Rendering.Text {
}

extension Markdown.Rendering.Text {
    public static var `default`: Self {
        .init { input in
            [.text(input.text)]
        }
    }
}
