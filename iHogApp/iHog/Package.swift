// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "iHog",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "Analytics",
            targets: ["Analytics"]
        ),
        .library(
            name: "Components",
            targets: ["Components"]
        ),
        .library(
            name: "DataStore",
            targets: ["DataStore"]
        ),
        .library(
            name: "Frontpanel",
            targets: ["Frontpanel"]
        ),
        .library(
            name: "iHog",
            targets: ["iHog"]
        ),
        .library(
            name: "Utilities",
            targets: ["Utilities"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            from: "0.42.0"
        ),
        .package(url: "https://github.com/TelemetryDeck/SwiftClient", from: "1.2.0"),
        .package(
            url: "https://github.com/SFSafeSymbols/SFSafeSymbols.git",
            .upToNextMajor(from: "4.0.0")
        ),
    ],
    targets: [
        .target(
            name: "Analytics",
            dependencies: [.product(name: "TelemetryClient", package: "SwiftClient")]
        ),
        .target(
            name: "Components",
            dependencies: [.product(name: "SFSafeSymbols", package: "SFSafeSymbols")]
        ),
        .target(name: "DataStore", dependencies: []),
        .target(
            name: "Frontpanel",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "SFSafeSymbols", package: "SFSafeSymbols"),
            ]
        ),
        .target(name: "Utilities", dependencies: []),
        .target(
            name: "iHog",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                "DataStore",
            ]
        ),
        .testTarget(
            name: "iHogTests",
            dependencies: [
                "iHog",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            ]
        ),
    ]
)
