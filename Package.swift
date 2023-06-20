// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "LottieExtensions",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "LottieExtensions", targets: ["LottieExtensions"]),
    ],
    dependencies: [
        .package(name: "Lottie", url: "https://github.com/airbnb/lottie-ios.git", from: "4.2.0"),
        .package(name: "UIExtensions", url: "https://github.com/teufelaudio/UIExtensions.git", from: "0.7.0")
    ],
    targets: [
        .target(name: "LottieExtensions", dependencies: ["Lottie", "UIExtensions"]),
    ]
)
