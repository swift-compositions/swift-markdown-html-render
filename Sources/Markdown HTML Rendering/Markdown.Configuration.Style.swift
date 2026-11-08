import CSS_HTML_Rendering
import CSS_Theming
import HTML_Rendering

extension Markdown.Configuration {

    public struct Style: Sendable {
        public var diagnostic: DiagnosticStyle
        public var blockQuote: BlockQuoteStyle
        public var icons: Icons

        public init(
            diagnostic: DiagnosticStyle = .default,
            blockQuote: BlockQuoteStyle = .default,
            icons: Icons = .default
        ) {
            self.diagnostic = diagnostic
            self.blockQuote = blockQuote
            self.icons = icons
        }
    }
}

extension Markdown.Configuration.Style {
    public static var `default`: Self { .init() }
}

extension Markdown.Configuration.Style {
}

extension Markdown.Configuration.Style.DiagnosticStyle {
    public static var `default`: Self {
        .init { name in
            switch name {
            case "Error": return .error
            case "Expected Failure": return .knownIssue
            case "Failed": return .issue
            case "Runtime Warning": return .runtimeWarning
            case "Warning": return .warning
            default: return nil
            }
        }
    }

    public func adding(_ name: String, _ diagnosticLevel: Markdown.Diagnostic.Level) -> Self {
        Markdown.Configuration.Style.DiagnosticStyle { n in
            if n == name { return diagnosticLevel }
            return self.level(n)
        }
    }
}

extension Markdown.Configuration.Style {
}

extension Markdown.Configuration.Style.BlockQuoteStyle {
    public static var `default`: Self {
        .init { name in
            switch name {
            case "Warning", "Correction":
                return (backgroundColor: .background.warning, borderColor: .border.warning)

            case "Important":
                return (
                    backgroundColor: .background.highlighted, borderColor: .border.highlighted
                )

            case "Announcement", "Tip":
                return (backgroundColor: .background.info, borderColor: .border.info)

            default:
                return (backgroundColor: .background.neutral, borderColor: .border.neutral)
            }
        }
    }

    public func adding(
        _ name: String,
        backgroundColor: DarkModeColor,
        borderColor: DarkModeColor
    ) -> Self {
        Markdown.Configuration.Style.BlockQuoteStyle { n in
            if n == name { return (backgroundColor: backgroundColor, borderColor: borderColor) }
            return self.style(n)
        }
    }
}

extension Markdown.Configuration.Style {
}

extension Markdown.Configuration.Style.Icons {


    public static var `default`: Self {
        .init(
            link: {
                HTML.AnyView {
                    LinkIcon()
                }
            },
            diagnostic: { kind in
                HTML.AnyView {
                    switch kind {
                    case .error:
                        Markdown.Diagnostic.Icon.error

                    case .failure:
                        Markdown.Diagnostic.Icon.failure

                    case .warning:
                        Markdown.Diagnostic.Icon.warning
                    }
                }
            }
        )
    }
}
