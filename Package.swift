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
            url: "https://github.com/sravni/IOSSravniSDK/releases/download/1.0.25/SravniSDK.xcframework.zip",
            checksum: "bbe2e58ac8dbea9c9e7e5cb98f01fbbe08e82c8cc52840b869f1e4b3cb1f67e0"
        )
    ]
)
