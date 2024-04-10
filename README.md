# LottieExtensions

AirBnB's Lottie SwiftUI View

Example usage:

```swift
LottieView(.init(name: animationFile.name, bundle: animationFile.bundle))
    .lottieAnimationConfiguration {
        $0.loopMode = .playOnce
        $0.play()
    }
```