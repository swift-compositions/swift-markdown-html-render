@_spi(DynamicHTML) import HTML_Rendering_Core
import Renderer

extension Markdown.Rendering {

    struct Replay: HTML.View, Sendable {
        let actions: [Renderer::Renderer.Document.Action]
    }
}

extension Markdown.Rendering.Replay {
    var body: some HTML.View { HTML.Empty() }

    static func _render(
        _ view: borrowing Self,
        context: inout Renderer::Renderer.Document.Context
    ) {
        context.splice(view.actions)
    }
}
