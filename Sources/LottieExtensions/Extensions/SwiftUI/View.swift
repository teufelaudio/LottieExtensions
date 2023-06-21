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
}
