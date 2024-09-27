// Copyright © 2023 Lautsprecher Teufel GmbH. All rights reserved.

import Lottie
import SwiftUI
import struct UIExtensions.DisableAnimationsEnvironmentKey

/// `LottieView` is a struct that adapts `LottieView.Configuration` to `UIViewRepresentable` protocol.
/// It enables using Lottie animations in SwiftUI.
public struct LottieView: UIViewRepresentable {
    public typealias Configuration = LottieAnimationView
    private let makeAnimationView: () -> LottieAnimationView

    /// Initializes a new `LottieView` with a closure that creates an instance of `LottieView.Configuration`.
    ///
    /// - Parameter configuration: A closure that creates a `LottieView.Configuration` instance.
    ///
    /// Example:
    /// ```swift
    /// LottieView(.init(name: animationFile.name, bundle: animationFile.bundle))
    /// ```
    public init(
        _ configuration: @escaping @autoclosure () -> Configuration
    ) {
        self.makeAnimationView = configuration
    }

    public func makeUIView(context: Context) -> UIView {
        let animationView = makeAnimationView()
        let wrapperView = UIView()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        wrapperView.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: wrapperView.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: wrapperView.widthAnchor)
        ])

        return wrapperView
    }

    public func updateUIView(_ uiView: LottieView.UIViewType, context: Context) {
            context.environment.lottieAnimationConfiguration(Self.animationView(uiView))
            if context.environment.disableAnimations {
                Self.animationView(uiView).pause()
                Self.animationView(uiView).currentProgress = context.environment.lottieAnimationDisabledProgress
            }
    }
}

// MARK: - Helpers
extension LottieView {
    static private func animationView(_ wrapperView: UIView) -> LottieAnimationView {
        guard let animationView = wrapperView.subviews.first as? LottieAnimationView
        else { preconditionFailure("Wrapper view should be initilized before this method called.") }
        return animationView
    }
}

// MARK: - Configurations
// MARK: LottieAnimationConfiguration
@MainActor
public struct LottieAnimationConfigurationKey: @preconcurrency EnvironmentKey {
    public static let defaultValue: (LottieAnimationView) -> Void = {
        $0.loopMode = .playOnce
        $0.contentMode = .scaleAspectFit
        $0.backgroundBehavior = .pauseAndRestore
    }
}

extension EnvironmentValues {
    public var lottieAnimationConfiguration: (LottieAnimationView) -> Void {
        get { self[LottieAnimationConfigurationKey.self] }
        set { self[LottieAnimationConfigurationKey.self] = newValue }
    }
}

// MARK: LottieAnimationDisabledProgress
public struct LottieAnimationDisabledProgressKey: EnvironmentKey {
    public static let defaultValue: CGFloat = 0.5
}

extension EnvironmentValues {
    public var lottieAnimationDisabledProgress: CGFloat {
        get { return self[LottieAnimationDisabledProgressKey.self] }
        set { self[LottieAnimationDisabledProgressKey.self] = newValue }
    }
}


