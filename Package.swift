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
            url: "https://github.com/sravni/IOSSravniSDK/releases/download/1.0.122/SravniSDK.xcframework.zip",
            checksum: "9f4a2c1de74d6d0a059a5cfa3748d40e26147cae36f7f0daa1bb03f9f9828fc1"
        )
    ]
)
