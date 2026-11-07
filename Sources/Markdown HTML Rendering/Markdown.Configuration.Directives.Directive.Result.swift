import CSS_HTML_Layout_Rendering
import CSS_HTML_Rendering
import CSS_Theming
import HTML_Rendering


extension Markdown.Configuration.Directives.Directive {
    public enum Result: Sendable {

        case rendered(HTML.AnyView)

        case useDefault

        case suppress
    }
}
