import HTML_Rendering

extension Markdown.Rendering {
    public struct LineBreak: Sendable {
        public var render: @Sendable () -> [Renderer.Document.Action]

        public init(render: @escaping @Sendable () -> [Renderer.Document.Action]) {
            self.render = render
        }
    }
}

extension Markdown.Rendering.LineBreak {
    private static let cached = Markdown.Rendering.capture { HTML.BR.Element() }

    public static var `default`: Self {
        .init { cached }
    }
}
