// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "SwiftUIPhone",
    platforms: [.macOS(.v11)],
    products: [.library(name: "SwiftUIPhone", targets: ["SwiftUIPhone"])],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftUIPhone",
            dependencies: [],
            resources: [.process("Resources")]
        )
    ]
)
