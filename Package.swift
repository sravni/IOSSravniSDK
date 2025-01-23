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
            url: "https://github.com/sravni/IOSSravniSDK/releases/download/1.0.97/SravniSDK.xcframework.zip",
            checksum: "9801ee5c7d4073fddee93eaff57acd31d6e6fba5f90405d91a56f455bef4c2ff"
        )
    ]
)
