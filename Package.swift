// swift-tools-version:5.3
import PackageDescription

let package = Package (
    name: "ForgeRock-iOS-SDK-Personal",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "FRCore", targets: ["FRCore"]),
        .library(name: "FRAuth", targets: ["FRAuth"])
    ],
    targets: [
        .target(name: "FRAuthC", dependencies: [], path: "FRAuth/FRAuth/SharedC"),
        .target(name: "FRCore", path: "FRCore/FRCore", exclude: ["Info.plist", "FRCore.h"]),
        .target(name: "FRAuth", dependencies: ["FRCore", "FRAuthC"], path: "FRAuth/FRAuth", exclude: ["Info.plist", "FRAuth.h", "SharedC/JBUtil.h", "SharedC/JBUtil.c", "FRAuth/FRAuth/SharedC/FRAuth.modulemap"])
    ]
)
