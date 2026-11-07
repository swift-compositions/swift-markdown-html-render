import CSS_HTML_Rendering
import CSS_Theming
import HTML_Rendering


extension Markdown.Configuration.Style {
    public struct BlockQuoteStyle: Sendable {
        public var style:
            @Sendable (_ name: String) -> (
                backgroundColor: DarkModeColor, borderColor: DarkModeColor
            )

        public init(
            _ style:
                @escaping @Sendable (_ name: String) -> (
                    backgroundColor: DarkModeColor, borderColor: DarkModeColor
                )
        ) {
            self.style = style
        }
    }
}
