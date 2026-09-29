@_spi(DynamicHTML) import HTML_Rendering_Core
import Renderer

extension Markdown.Rendering {

    struct Replay: HTML.View, Sendable {
        let actions: [Renderer.Document.Render.Action]
    }
}

extension Markdown.Rendering.Replay {
    var body: some HTML.View { HTML.Empty() }

    static func _render(
        _ view: borrowing Self,
        context: inout Renderer.Document.Render.Context
    ) {
        context.splice(view.actions)
    }
}
