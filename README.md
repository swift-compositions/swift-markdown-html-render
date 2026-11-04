# swift-markdown-html-render

Use this package when you write content in Markdown and want it inside an HTML page built with swift-html-render, as a view rather than an HTML string. Start from `Markdown`, which renders as an `HTML.View`. Change how an element renders with `Markdown.Rendering`, and change directives, slugs and diagnostic styles with `Markdown.Configuration`. If the output is a PDF, use swift-pdf instead.

## Laws

- Markdown is parsed with block directives enabled. `@Comment` renders nothing. `@Button` renders its children as a link to its raw argument text. `@Video` reads its `source` and `poster` arguments. A directive no handler renders is replaced by its children.
- `Markdown.Configuration.Directives.adding(_:)` asks the receiver first and the added handler only when the receiver answers `useDefault`.
- Directive arguments are read as `key: value` pairs separated by commas or spaces. A value may be quoted with single or double quotes. Reading stops at the first piece without a colon.
- Every heading gets an anchor id from the slug generator. The default slug is the heading text split on anything that isn't a letter or digit, joined with hyphens and lowercased, so text with only punctuation gives an empty slug. A slug already used in the same document gets `-1`, `-2` and so on, and `Markdown.Configuration.SlugGenerator.prefixed(_:)` puts the prefix before that suffix.
- `Markdown.tableOfContents(from:configuration:rendering:)` lists only headings that are followed by a `@T` directive before the next heading. A heading without one is left out, though it still gets its slug.
- A `@T` directive takes a time and an optional speaker separated by a comma and a space. The time is seconds, minutes and seconds, or hours, minutes and seconds, separated by colons. The rendered anchor id is `t` followed by the total number of seconds. Minutes are zero padded only when there are hours.
- A block quote whose aside kind the diagnostic style recognises renders as a diagnostic. By default those kinds are Error, Expected Failure, Failed, Runtime Warning and Warning. Any other block quote renders as a quote titled with its kind.
- A fenced code block's info string is read as a language, then an optional colon and the lines to highlight. The language becomes the class `language-` plus its name, and the lines go in the `data-line` attribute.
- HTML blocks and inline HTML in the Markdown are written to the output as they are, without escaping.
- A soft line break renders as a space. A link without a destination points to `#`.
- `String.init(markdown:)` joins its lines with single newlines. `String.init(markdownWithParagraphs:)` drops empty lines and joins the rest with blank lines. `String.init(markdownSections:)` treats empty lines as section breaks and separates sections with one blank line.
