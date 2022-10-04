// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "Cabinet",
    platforms: [
        .iOS(.v11), .macOS(.v10_15)
    ],
    products: [
        .library(name: "Cabinet", targets: [
            "CabinetCore",
            "CabinetCollections",
            "CabinetCrypto",
            "CabinetPartialTypes",
            "CabinetSwiftUI",
            "CabinetCoding",
            "CabinetPropertyWrappers",
            "CabinetFoundation"
        ]),
        .library(name: "CabinetCollections", targets: ["CabinetCollections"]),
        .library(name: "CabinetCrypto", targets: ["CabinetCrypto"]),
        .library(name: "CabinetPartialTypes", targets: ["CabinetPartialTypes"]),
        .library(name: "CabinetSwiftUI", targets: ["CabinetSwiftUI"]),
        .library(name: "CabinetCoding", targets: ["CabinetCoding"]),
        .library(name: "CabinetPropertyWrappers", targets: ["CabinetPropertyWrappers"]),
        .library(name: "CabinetFoundation", targets: ["CabinetFoundation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/philprime/Flow", .upToNextMajor(from: "1.0.0")),
        //dev .package(url: "https://github.com/Quick/Quick", .upToNextMajor(from: "2.2.0")),
        //dev .package(url: "https://github.com/Quick/Nimble", .upToNextMajor(from: "8.0.7"))
    ],
    targets: [
        .target(name: "CabinetCore", dependencies: ["Flow"]),
        //dev .testTarget(name: "CabinetCoreTests", dependencies: [
        //dev     "CabinetCore",
        //dev     "Quick",
        //dev     "Nimble"
        //dev ]),
        .target(name: "CabinetCollections", dependencies: ["Flow"]),
        //dev .testTarget(name: "CabinetCollectionsTests", dependencies: [
        //dev     "CabinetCollections",
        //dev     "Quick",
        //dev     "Nimble"
        //dev ]),
        .target(name: "CabinetFoundation"),
        //dev .testTarget(name: "CabinetFoundationTests", dependencies: [
        //dev     "CabinetFoundation",
        //dev     "Quick",
        //dev     "Nimble"
        //dev ]),
        .target(name: "CabinetPartialTypes"),
        .target(name: "CabinetCrypto", dependencies: ["Flow"]),
        .target(name: "CabinetSwiftUI"),
        //dev .testTarget(name: "CabinetCryptoTests", dependencies: [
        //dev     "CabinetCrypto",
        //dev     "Quick",
        //dev     "Nimble"
        //dev ]),
        .target(name: "CabinetCoding"),
        .target(name: "CabinetPropertyWrappers"),
        //dev .testTarget(name: "CabinetPropertyWrappersTests", dependencies: [
        //dev     "CabinetPropertyWrappers",
        //dev     "Quick",
        //dev     "Nimble"
        //dev ]),
    ]
)
