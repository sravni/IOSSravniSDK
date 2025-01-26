// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SravniSDK",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "SravniSDK", targets: ["SravniSDK"])
    ],
    targets: [
        .binaryTarget(
            name: "SravniSDK",
            url: "https://github.com/sravni/IOSSravniSDK/releases/download/1.0.145/SravniSDK.xcframework.zip",
            checksum: "2bdf49fa7931d8c4c4c7c60acb174ada8a78dc5a5ae0ad91c4c27c1e96a5ebb3"
        )
    ]
)
