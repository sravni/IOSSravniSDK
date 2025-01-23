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
            url: "https://github.com/sravni/IOSSravniSDK/releases/download/1.0.88/SravniSDK.xcframework.zip",
            checksum: "55a3c64a4963cd4d4e415a995aa4cae7a879a77b1dc64bd9762e25c113c0d81b"
        )
    ]
)
