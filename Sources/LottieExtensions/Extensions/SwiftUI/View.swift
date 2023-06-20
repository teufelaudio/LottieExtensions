// Copyright © 2023 Lautsprecher Teufel GmbH. All rights reserved.

import Lottie
import SwiftUI

extension View {
    /// Applies a configuration to the `LottieAnimationView` in the environment.
    ///
    /// Use this modifier to provide a `LottieAnimationView` instance with specific properties that will be
    /// used as a configuration in the environment. The configuration will be applied when a `LottieView` instance
    /// is created or updated in the context of this view.
    ///
    /// - Parameter lottieAnimationView: The `LottieAnimationView` instance that contains the configuration to be applied.
    /// - Returns: A modified version of the view with the new `LottieAnimationView` configuration.
    ///
    /// Example:
    /// ```swift
    /// LottieView(LottieAnimationView(name: "animation"))
    ///     .lottieAnimationConfiguration {
    ///           $0.loopMode = .playOnce
    ///      }
    /// ```
    ///
    @ViewBuilder
    public func lottieAnimationConfiguration(
        _ lottieAnimationViewClosure: @escaping (LottieAnimationView) -> Void
    ) -> some View {
        environment(\.lottieAnimationConfiguration, lottieAnimationViewClosure)
    }
}
