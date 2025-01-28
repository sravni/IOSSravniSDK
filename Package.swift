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
            url: "https://github.com/sravni/IOSSravniSDK/releases/download/1.0.185/SravniSDK.xcframework.zip",
            checksum: "d57fe8e4056cc5ea03aba052d9b3dd4c503db09c4a7a72f9aa6cfed9a80e13b2"
        )
    ]
)
