// swift-tools-version:5.5

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
        .library(name: "CabinetCore", targets: ["CabinetCore"]),
        .library(name: "CabinetCollections", targets: ["CabinetCollections"]),
        .library(name: "CabinetCrypto", targets: ["CabinetCrypto"]),
        .library(name: "CabinetPartialTypes", targets: ["CabinetPartialTypes"]),
        .library(name: "CabinetSwiftUI", targets: ["CabinetSwiftUI"]),
        .library(name: "CabinetCoding", targets: ["CabinetCoding"]),
        .library(name: "CabinetPropertyWrappers", targets: ["CabinetPropertyWrappers"]),
        .library(name: "CabinetFoundation", targets: ["CabinetFoundation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/philprime/Flow", .exact("1.0.2")),
        //dev .package(url: "https://github.com/nalexn/ViewInspector", .exact("0.10.2"))
    ],
    targets: [
        .target(name: "CabinetCore", dependencies: ["Flow"]),
        //dev .testTarget(name: "CabinetCoreTests", dependencies: [
        //dev     "CabinetCore",
        //dev ]),
        .target(name: "CabinetCollections", dependencies: ["Flow"]),
        //dev .testTarget(name: "CabinetCollectionsTests", dependencies: [
        //dev     "CabinetCollections",
        //dev ]),
        .target(name: "CabinetFoundation"),
        //dev .testTarget(name: "CabinetFoundationTests", dependencies: [
        //dev     "CabinetFoundation",
        //dev ]),
        .target(name: "CabinetPartialTypes"),
        .target(name: "CabinetCrypto", dependencies: ["Flow"]),
        //dev .testTarget(name: "CabinetCryptoTests", dependencies: [
        //dev     "CabinetCrypto",
        //dev ]),
        .target(name: "CabinetCoding"),
        .target(name: "CabinetPropertyWrappers"),
        //dev .testTarget(name: "CabinetPropertyWrappersTests", dependencies: [
        //dev     "CabinetPropertyWrappers",
        //dev ]),
        .target(name: "CabinetSwiftUI"),
        //dev .testTarget(name: "CabinetSwiftUITests", dependencies: [
        //dev     "CabinetSwiftUI",
        //dev     "ViewInspector"
        //dev ]),
    ]
)
