// swift-tools-version:5.3
import PackageDescription

let package = Package (
    name: "ForgeRock-iOS-SDK-Personal",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "FRCore", targets: ["FRCore"])
    ],
    targets: [
        .target(name: "FRCore", path: "FRCore/FRCore", exclude: ["Info.plist", "FRCore.h"])
    ]
)
