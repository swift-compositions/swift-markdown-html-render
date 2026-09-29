extension Markdown.Rendering {
    public struct SoftBreak: Sendable {
        public var render: @Sendable () -> [Renderer.Document.Action]

        public init(render: @escaping @Sendable () -> [Renderer.Document.Action]) {
            self.render = render
        }
    }
}

extension Markdown.Rendering.SoftBreak {
    public static var `default`: Self {
        .init {
            [.text(" ")]
        }
    }
}
