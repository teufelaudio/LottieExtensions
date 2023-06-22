// Copyright © 2023 Lautsprecher Teufel GmbH. All rights reserved.

import Lottie
import SwiftUI

extension View {
    /// Applies a configuration to the `LottieAnimationView` in the environment.
    ///
    /// Use this modifier to provide a `LottieView.Configuration` instance with specific properties that will be
    /// used as a configuration in the environment. The configuration will be applied when a `LottieView` instance
    /// is created or updated in the context of this view.
    ///
    /// - Parameter lottieConfigurationClosure: The `LottieView.Configuration` instance that contains the configuration to be applied.
    /// - Returns: A modified version of the view with the new `LottieView.Configuration` configuration.
    ///
    /// Example:
    /// ```swift
    /// LottieView(.init(name: animationFile.name, bundle: animationFile.bundle))
    ///     .lottieAnimationConfiguration {
    ///           $0.loopMode = .playOnce
    ///      }
    /// ```
    ///
    @ViewBuilder
    @inlinable
    public func lottieAnimationConfiguration(
        _ lottieConfigurationClosure: @escaping (LottieView.Configuration) -> Void
    ) -> some View {
        environment(\.lottieAnimationConfiguration, lottieConfigurationClosure)
    }

    /// Use this method to specify the desired progress of a Lottie animation when animations are disabled in the environment. This value has no effect if animations are not disabled.
    ///
    /// - Parameter progress: The desired progress of the animation when animations are disabled. This is a value between `0.0` (the start of the animation) and `1.0` (the end of the animation).
    /// - Returns: A view that has its Lottie animation's disabled progress modified by the specified amount.
    ///
    /// The following example shows how to set the Lottie animation's disabled progress to 50% (0.5):
    ///
    ///     LottieView(animation)
    ///         .lottieAnimationDisabledProgress(0.5)
    ///
    @ViewBuilder
    @inlinable
    public func lottieAnimationDisabledProgress(
        _ progress: CGFloat
    ) -> some View {
        environment(\.lottieAnimationDisabledProgress, progress)
    }
}
