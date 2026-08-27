@_spi(DynamicHTML) import HTML_Rendering_Core
import Render

extension Markdown.Rendering {

    struct Replay: HTML.View, Sendable {
        let actions: [Render.Render.Action]
    }
}

extension Markdown.Rendering.Replay {
    var body: some HTML.View { HTML.Empty() }

    static func _render(
        _ view: borrowing Self,
        context: inout Render.Render.Context
    ) {
        context.splice(view.actions)
    }
}
