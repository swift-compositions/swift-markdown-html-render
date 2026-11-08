import HTML_Rendering

extension Markdown.Rendering {
    public struct Table: Sendable {
        public var render: @Sendable (Input) -> [Renderer.Document.Action]

        public init(render: @escaping @Sendable (Input) -> [Renderer.Document.Action]) {
            self.render = render
        }
    }
}

extension Markdown.Rendering.Table {
}

extension Markdown.Rendering.Table {
    public static var `default`: Self {
        .init { input in
            var actions: [Renderer.Document.Action] = []
            actions.append(
                .push(.element(tagName: "table", isBlock: true, isVoid: false, isPreElement: false))
            )
            if input.hasHead {
                actions.append(
                    .push(
                        .element(
                            tagName: "thead",
                            isBlock: true,
                            isVoid: false,
                            isPreElement: false
                        )
                    )
                )
                actions.append(
                    .push(
                        .element(tagName: "tr", isBlock: true, isVoid: false, isPreElement: false)
                    )
                )
                actions.append(contentsOf: input.head)
                actions.append(.pop(.element(isBlock: true)))
                actions.append(.pop(.element(isBlock: true)))
            }
            if input.hasBody {
                actions.append(
                    .push(
                        .element(
                            tagName: "tbody",
                            isBlock: true,
                            isVoid: false,
                            isPreElement: false
                        )
                    )
                )
                actions.append(contentsOf: input.body)
                actions.append(.pop(.element(isBlock: true)))
            }
            actions.append(.pop(.element(isBlock: true)))
            return actions
        }
    }
}
