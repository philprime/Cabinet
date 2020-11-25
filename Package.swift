// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Cabinet",
    products: [
        .library(name: "Cabinet", targets: ["Cabinet"]),
        .library(name: "CabinetCrypto", targets: ["CabinetCrypto"]),
            .library(name: "CabinetPartialTypes", targets: ["CabinetPartialTypes"])
    ],
    dependencies: [
        .package(url: "https://github.com/philprime/Flow", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/Quick/Quick", .upToNextMajor(from: "2.2.0")),
        .package(url: "https://github.com/Quick/Nimble", .upToNextMajor(from: "8.0.7"))
    ],
    targets: [
        .target(name: "CabinetPartialTypes"),
        .target(name: "CabinetCrypto", dependencies: ["Flow"]),
        .testTarget(name: "CabinetCryptoTests", dependencies: [
            "CabinetCrypto",
            "Quick",
            "Nimble"
        ]),
        .target(name: "Cabinet", dependencies: ["Flow"]),
        .testTarget(name: "CabinetTests", dependencies: [
            "Cabinet",
            "Quick",
            "Nimble"
        ])
    ]
)
