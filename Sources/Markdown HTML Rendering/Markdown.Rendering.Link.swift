import CSS_HTML_Rendering
import HTML_Rendering

extension Markdown.Rendering {
    public struct Link: Sendable {
        public var render: @Sendable (Input) -> [Renderer.Document.Action]

        public init(render: @escaping @Sendable (Input) -> [Renderer.Document.Action]) {
            self.render = render
        }
    }
}

extension Markdown.Rendering.Link {
}

extension Markdown.Rendering.Link {
    public static var `default`: Self {
        .init { input in
            Markdown.Rendering.capture {
                HTML.Anchor.Element(href: .init(input.destination ?? "#")) {
                    Markdown.Rendering.Replay(actions: input.children)
                }
                .attribute(HTML.Title.Element.tag, input.title)
            }
        }
    }
}
