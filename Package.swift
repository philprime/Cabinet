// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Cabinet",
    products: [
        .library(
            name: "Cabinet",
            targets: ["Cabinet"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Cabinet",
            dependencies: []),
        .testTarget(
            name: "CabinetTests",
            dependencies: ["Cabinet"]),
    ]
)
