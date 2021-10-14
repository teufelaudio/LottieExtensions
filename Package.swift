// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "LottieExtensions",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "LottieExtensions", targets: ["LottieExtensions"]),
        .library(name: "LottieExtensionsAllStatic", targets: ["LottieExtensionsAllStatic"]),
    ],
    dependencies: [
        .package(name: "Lottie", url: "https://github.com/airbnb/lottie-ios.git", from: "3.2.3"),
        .package(name: "UIExtensions", url: "https://github.com/teufelaudio/UIExtensions.git", .upToNextMajor(from: "0.2.10"))
    ],
    targets: [
        .target(name: "LottieExtensions", dependencies: ["Lottie", "UIExtensions"]),
        .target(name: "LottieExtensionsAllStatic", dependencies: ["Lottie", .product(name: "UIExtensionsAllStatic", package: "UIExtensions")])
    ]
)
