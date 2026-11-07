import CSS_HTML_Rendering
import HTML_Rendering
@_spi(DynamicHTML) import HTML_Rendering_Core
import Ownership
import Renderer


extension Markdown.Rendering.Frame {
    struct CaptureState {
        var actions: [Renderer::Renderer.Document.Action] = []
        var childrenIndex: Int? = nil
    }
}
