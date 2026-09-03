// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-markdown-html-render",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "Markdown HTML Rendering", targets: ["Markdown HTML Rendering"]),
        .library(name: "Markdown Previews", targets: ["Markdown Previews"]),

    ],
    dependencies: [
        .package(url: "https://github.com/swift-compositions/swift-html-render.git", branch: "main"),
        .package(url: "https://github.com/swift-compositions/swift-css.git", branch: "main"),
        .package(url: "https://github.com/swift-compositions/swift-css-html-layout-render.git", branch: "main"),
        .package(url: "https://github.com/swiftlang/swift-markdown.git", from: "0.4.0"),
        .package(url: "https://github.com/swift-molecules/swift-ownership.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-standard-library-extensions.git", branch: "main"),

    ],
    targets: [
        .target(
            name: "SwiftMarkdown",
            dependencies: [
                .product(name: "Markdown", package: "swift-markdown"),
            ]
        ),
        .target(
            name: "Markdown HTML Rendering",
            dependencies: [
                .product(name: "HTML Rendering", package: "swift-html-render"),
                .product(name: "CSS", package: "swift-css"),
                .product(name: "CSS Theming", package: "swift-css"),
                .product(name: "CSS HTML Layout Rendering", package: "swift-css-html-layout-render"),
                .target(name: "SwiftMarkdown"),
                .product(name: "Ownership Mutable", package: "swift-ownership"),
                .product(name: "Standard Library Extensions", package: "swift-standard-library-extensions"),
            ]
        ),
        .target(
            name: "Markdown Previews",
            dependencies: [
                .target(name: "Markdown HTML Rendering"),
            ]
        ),

        .testTarget(
            name: "Markdown HTML Rendering Tests",
            dependencies: [
                .target(name: "Markdown HTML Rendering"),
            ],
            path: "Tests/Markdown HTML Rendering Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
