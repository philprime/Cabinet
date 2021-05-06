// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Cabinet",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "Cabinet", targets: [
            "Cabinet",
            "CabinetCollections",
        ]),
        .library(name: "CabinetCollections", targets: ["CabinetCollections"]),
        .library(name: "CabinetCrypto", targets: ["CabinetCrypto"]),
        .library(name: "CabinetPartialTypes", targets: ["CabinetPartialTypes"]),
        .library(name: "CabinetSwiftUI", targets: ["CabinetSwiftUI"]),
        .library(name: "CabinetCoding", targets: ["CabinetCoding"]),
        .library(name: "CabinetPropertyWrappers", targets: ["CabinetPropertyWrappers"])
    ],
    dependencies: [
        .package(url: "https://github.com/philprime/Flow", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/Quick/Quick", .upToNextMajor(from: "2.2.0")),
        .package(url: "https://github.com/Quick/Nimble", .upToNextMajor(from: "8.0.7"))
    ],
    targets: [
        .target(name: "Cabinet", dependencies: ["Flow"]),
        .target(name: "CabinetCollections", dependencies: ["Flow"]),
        .testTarget(name: "CabinetCollectionsTests", dependencies: [
            "CabinetCollections",
            "Quick",
            "Nimble"
        ]),
        .target(name: "CabinetPartialTypes"),
        .target(name: "CabinetCrypto", dependencies: ["Flow"]),
        .target(name: "CabinetSwiftUI"),
        .testTarget(name: "CabinetCryptoTests", dependencies: [
            "CabinetCrypto",
            "Quick",
            "Nimble"
        ]),
        .target(name: "CabinetCoding"),
        .testTarget(name: "CabinetTests", dependencies: [
            "Cabinet",
            "Quick",
            "Nimble"
        ]),
        .target(name: "CabinetPropertyWrappers"),
        .testTarget(name: "CabinetPropertyWrappersTests", dependencies: [
            "CabinetPropertyWrappers",
            "Quick",
            "Nimble"
        ]),
    ]
)
