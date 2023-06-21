// Copyright © 2023 Lautsprecher Teufel GmbH. All rights reserved.

import Lottie
import SwiftUI
import struct UIExtensions.DisableAnimationsEnvironmentKey

/// `LottieView` is a struct that adapts `LottieView.Configuration` to `UIViewRepresentable` protocol.
/// It enables using Lottie animations in SwiftUI.
public struct LottieView: UIViewRepresentable {
    public typealias Configuration = LottieAnimationView
    private let makeAnimationView: () -> LottieAnimationView

    // Deprecated
    private let deprecatedCompletion: LottieCompletionBlock?
    private let runDeprecatedLogic: ((UIView, Context) -> Void)?

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
        self.deprecatedCompletion = nil
        self.runDeprecatedLogic = nil
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

        runDeprecatedLogic?(wrapperView, context)
        return wrapperView
    }

    public func updateUIView(_ uiView: LottieView.UIViewType, context: Context) {
        context.environment.lottieAnimationConfiguration(Self.animationView(uiView))
        runDeprecatedLogic?(uiView, context)
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
public struct LottieAnimationConfigurationKey: EnvironmentKey {
    public static var defaultValue: (LottieAnimationView) -> Void = {
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

// MARK: LottieAnimationProgress: Deprecated
extension EnvironmentValues {
    /// Deprecated
    /// The progress of the Lottie animation.
    @available(*, deprecated, message: "This property is deprecated. Please use `lottieAnimationConfiguration` to configure and control Lottie animations.")
    public var lottieAnimationProgress: CGFloat {
        get { return self[LottieAnimationProgressEnvironmentKey.self] }
        set { self[LottieAnimationProgressEnvironmentKey.self] = newValue }
    }
}

public struct LottieAnimationProgressEnvironmentKey: EnvironmentKey {
    public static let defaultValue: CGFloat = 0.5
}

// MARK: - Deprecated
extension LottieView {
    /// Deprecated initializer
    /// - Parameters:
    ///   - filename: Name of the Lottie animation file.
    ///   - bundle: Bundle containing the Lottie animation file.
    ///   - loopMode: Animation loop mode. Defaults to `.playOnce`.
    ///   - completion: Completion block to be executed when animation finishes. Defaults to `nil`.
    /// - Returns: An instance of `LottieView`.
    @available(*, deprecated, message: "This initializer is deprecated. Please use `init(_ animationView: LottieAnimationView)` instead.")
    @_disfavoredOverload
    public init(
        filename: String,
        bundle: Bundle,
        loopMode: LottieLoopMode = .playOnce,
        completion: LottieCompletionBlock? = nil
    ) {
        let animationView = LottieAnimationView(name: filename, bundle: bundle)
        animationView.loopMode = loopMode
        self.makeAnimationView = { animationView }
        self.deprecatedCompletion = completion
        self.runDeprecatedLogic = { view, context in
            if context.environment.disableAnimations {
                LottieView.animationView(view).currentProgress = context.environment.lottieAnimationProgress
            } else {
                LottieView.animationView(view).play(completion: completion)
            }
        }
    }
}
