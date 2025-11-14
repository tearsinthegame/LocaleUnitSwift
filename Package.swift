// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.
// Might be changed to 5.7

import PackageDescription

let package = Package(
    name: "LocaleUnitSwift",
    platforms: [
        .macOS(.v13), .iOS(.v16), .tvOS(.v16), .macCatalyst(.v16), .watchOS(.v9)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LocaleUnitSwift",
            targets: ["LocaleUnitSwift"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LocaleUnitSwift"),
        .testTarget(
            name: "LocaleUnitSwiftTests",
            dependencies: ["LocaleUnitSwift"]),
    ]
)
