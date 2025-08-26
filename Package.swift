// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "LibreTransmitter",
    defaultLocalization: "en",
    platforms: [.iOS("15.0")],
    products: [
        .library(name: "LibreTransmitter", targets: ["LibreTransmitter"]),
        .library(name: "LibreTransmitterUI", targets: ["LibreTransmitterUI"]),
    ],
    dependencies: [
        .package(
           url: "https://github.com/LoopKit/LoopKit",
           branch: "dev"
        ),
        .package(
            url: "https://github.com/LoopKit/G7SensorKit",
           branch: "main"
        ),
        .package(
            url: "https://github.com/LoopKit/CGMBLEKit",
           branch: "dev"
        ),
        .package(
            url: "https://github.com/LoopKit/dexcom-share-client-swift",
           branch: "dev"
        ),
        .package(
            url: "https://github.com/LoopKit/MKRingProgressView",
           branch: "dev"
        ),
        .package(
            url: "https://github.com/LoopKit/RileyLinkKit",
           branch: "dev"
        ),
        .package(
            url: "https://github.com/LoopKit/OmniBLE",
           branch: "dev"
        ),
        .package(
            url: "https://github.com/LoopKit/OmniKit",
           branch: "main"
        ),
        .package(
            url: "https://github.com/LoopKit/MinimedKit",
           branch: "main"
        ),
        .package(
            url: "https://github.com/bastiaanv/DanaKit",
           branch: "dev"
        ),
        .package(
            url: "https://github.com/LoopKit/TidepoolService",
           branch: "dev"
        )
    ],
    targets: [
        .binaryTarget(
            name: "RawGlucose",
            path: "RawGlucose.xcframework"
        ),

        .target(name: "Common", path: "Common"),
        .target(name: "Bluetooth", dependencies: ["Common"], path: "Bluetooth"),
        .target(name: "LibreSensor", dependencies: ["Common", "Bluetooth"], path: "LibreSensor"),

        .target(
            name: "LibreTransmitter",
            dependencies: [
                "Common", "Bluetooth", "LibreSensor", "RawGlucose",
                .product(name: "LoopKit", package: "LoopKit"),
                .product(name: "LoopKitUI", package: "LoopKit")
            ],
            path: "LibreTransmitter"
        ),
        .target(
            name: "LibreTransmitterUI",
            dependencies: [
                "LibreTransmitter",
                .product(name: "LoopKit", package: "LoopKit"),
                .product(name: "LoopKitUI", package: "LoopKit")
            ],
            path: "LibreTransmitterUI"
        ),
        .target(
            name: "G7SensorKit",
            dependencies: [
                "G7SensorKit",
                .product(name: "G7SensorKit", package: "G7SensorKit"),
            ],
            path: "G7SensorKit"
        ),
        .target(
            name: "CGMBLEKit",
            dependencies: [
                "CGMBLEKit",
                .product(name: "CGMBLEKit", package: "CGMBLEKit"),
            ],
            path: "CGMBLEKit"
        ),
         .target(
            name: "dexcom-share-client-swift",
            dependencies: [
                "dexcom-share-client-swift",
                .product(name: "dexcom-share-client-swift", package: "dexcom-share-client-swift"),
            ],
            path: "dexcom-share-client-swift"
        ),
        .target(
            name: "MKRingProgressView",
            dependencies: [
                "MKRingProgressView",
                .product(name: "MKRingProgressView", package: "MKRingProgressView"),
            ],
            path: "MKRingProgressView
        ),
        .target(
            name: "RileyLinkKit",
            dependencies: [
                "RileyLinkKit",
                .product(name: "RileyLinkKit", package: "RileyLinkKit"),
            ],
            path: "RileyLinkKit
        ),
         .target(
            name: "OmniBLE",
            dependencies: [
                "OmniBLE",
                .product(name: "OmniBLE", package: "OmniBLE"),
            ],
            path: "OmniBLE
        ),
         .target(
            name: "OmniKit",
            dependencies: [
                "OmniKit",
                .product(name: "OmniKit", package: "OmniKit"),
            ],
            path: "OmniKit
        ),
        .target(
            name: "MinimedKit",
            dependencies: [
                "MinimedKit",
                .product(name: "MinimedKit", package: "MinimedKit"),
            ],
            path: "MinimedKit
        ),
        .target(
            name: "DanaKit",
            dependencies: [
                "DanaKit",
                .product(name: "DanaKit", package: "DanaKit"),
            ],
            path: "DanaKit
        ),
        .target(
            name: "TidepoolService",
            dependencies: [
                "TidepoolService",
                .product(name: "TidepoolService", package: "TidepoolService"),
            ],
            path: "TidepoolService
        )
    ]
)
