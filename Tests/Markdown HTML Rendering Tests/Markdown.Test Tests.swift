import Markdown_HTML_Rendering
import Testing

enum `Markdown Tests` {}

extension `Markdown Tests` {
    @Suite struct Test {
        @Suite struct Unit {}
        @Suite struct EdgeCase {}
        @Suite struct Integration {}
        @Suite(.serialized) struct Performance {}
    }
}
