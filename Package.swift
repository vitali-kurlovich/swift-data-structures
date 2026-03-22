// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-data-structures",
    platforms: [
        .macOS(.v13),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Lists",
            targets: ["Lists"]
        ),

        .library(name: "Caches", targets: ["Caches"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vitali-kurlovich/swift-benchmarks", from: "0.3.0"),
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.7.0"),
        .package(url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.1.0"),
        .package(url: "https://github.com/apple/swift-collections.git", .upToNextMinor(from: "1.4.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Lists"
        ),

        .target(
            name: "Caches",
            dependencies: [
                .product(name: "Collections", package: "swift-collections"),
                "Lists",
            ]
        ),
        .testTarget(
            name: "ListsTests",
            dependencies: ["Lists"]
        ),
        .testTarget(
            name: "CachesTests",
            dependencies: ["Lists", "Caches"]
        ),

        .executableTarget(
            name: "BenchmarkCLI",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Benchmarks", package: "swift-benchmarks"),
                "Lists", "Caches",
            ],
            path: "Benchmarks"

        ),
    ]
)
