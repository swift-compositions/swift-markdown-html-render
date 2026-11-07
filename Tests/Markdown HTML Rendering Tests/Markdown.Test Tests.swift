import Markdown_HTML_Rendering
import Testing

enum `Markdown Tests` {}

extension `Markdown Tests` {
    @Suite struct Test {
        @Suite struct Unit {}
        @Suite struct Integration {}
        @Suite(.serialized) struct Performance {}
    }
}

extension `Markdown Tests`.Test {
    @Suite struct EdgeCase {}
}
