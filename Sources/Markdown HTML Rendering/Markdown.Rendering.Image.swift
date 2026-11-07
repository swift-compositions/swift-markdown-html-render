import CSS_HTML_Layout_Rendering
import CSS_HTML_Rendering
import CSS_Theming
import HTML_Rendering

extension Markdown.Rendering {
    public struct Image: Sendable {
        public var render: @Sendable (Input) -> [Renderer.Document.Action]

        public init(render: @escaping @Sendable (Input) -> [Renderer.Document.Action]) {
            self.render = render
        }
    }
}

extension Markdown.Rendering.Image {
}

extension Markdown.Rendering.Image {
    public static var `default`: Self {
        .init { input in
            guard let source = input.source else { return [] }
            return Markdown.Rendering.capture {
                VStack(alignment: .center) {
                    HTML.Anchor.Element(href: .init(value: source)) {
                        HTML.Image.Element(
                            src: .init(value: source),
                            alt: .init(value: input.title ?? "")
                        )
                        .css
                        .marginTop(MarginTop.zero)
                        .marginBottom(MarginBottom.zero)
                        .marginLeft(MarginLeft.rem(1))
                        .marginRight(MarginRight.rem(1))
                        .borderRadius(BorderRadius.uniform(.px(6)))
                    }
                }
            }
        }
    }
}
