// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "LottieExtensions",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)],
    products: [
        .library(name: "LottieExtensions", targets: ["LottieExtensions"]),
    ],
    dependencies: [
        .package(name: "Lottie", url: "https://github.com/airbnb/lottie-ios.git", from: "3.2.3"),
        .package(name: "UIExtensions", url: "https://github.com/teufelaudio/UIExtensions.git", from: "0.2.20")
    ],
    targets: [
        .target(name: "LottieExtensions", dependencies: ["Lottie", "UIExtensions"]),
    ]
)
