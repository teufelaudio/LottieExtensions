// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "LottieExtensions",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "LottieExtensions", targets: ["LottieExtensions"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-ios.git", from: "4.4.0"),
        .package(url: "https://github.com/teufelaudio/UIExtensions.git", from: "2.1.0")
    ],
    targets: [
        .target(
            name: "LottieExtensions",
            dependencies: [
                .product(name: "Lottie", package: "lottie-ios"),
                .product(name: "UIExtensions", package: "UIExtensions"),
            ]),
    ]
)
