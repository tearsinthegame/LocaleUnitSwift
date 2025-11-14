// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LocaleUnitSwift",
    platforms: [
        .macOS(.v13), .iOS(.v16), .tvOS(.v16), .macCatalyst(.v16), .watchOS(.v9)
    ],
    products: [
        .library(
            name: "LocaleUnitSwift",
            targets: ["LocaleUnitSwift"]),
    ],
    targets: [

        .target(
            name: "LocaleUnitSwift"),
        .testTarget(
            name: "LocaleUnitSwiftTests",
            dependencies: ["LocaleUnitSwift"]),
    ]
)
