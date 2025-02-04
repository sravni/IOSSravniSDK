// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SravniSDK",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "SravniSDK", targets: ["SravniSDK"])
    ],
    targets: [
        .binaryTarget(
            name: "SravniSDK",
            url: "https://github.com/sravni/IOSSravniSDK/releases/download/1.0.196/SravniSDK.xcframework.zip",
            checksum: "7d7c7cfc055169f0e63beb55f9ef1d9d0ace1a0750c1848999e377e679a2f86a"
        )
    ]
)
