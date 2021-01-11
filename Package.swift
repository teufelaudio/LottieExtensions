// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "LottieExtensions",
    platforms: [.iOS(.v13)],
    products: [.library(name: "LottieExtensions", targets: ["LottieExtensions"])],
    dependencies: [
        .package(name: "Lottie", url: "https://github.com/airbnb/lottie-ios.git", from: "3.1.9"),
        .package(name: "UIExtensions", url: "https://github.com/teufelaudio/UIExtensions.git", .upToNextMajor(from: "0.1.10"))
    ],
    targets: [
        .target(name: "LottieExtensions", dependencies: ["Lottie", "UIExtensions"])
    ]
)
