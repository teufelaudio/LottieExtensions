// Copyright © 2022 Lautsprecher Teufel GmbH. All rights reserved.

import SwiftUI

extension EnvironmentValues {
    public var lottieAnimationProgress: CGFloat {
        get { return self[LottieAnimationProgressEnvironmentKey.self] }
        set { self[LottieAnimationProgressEnvironmentKey.self] = newValue }
    }
}

public struct LottieAnimationProgressEnvironmentKey: EnvironmentKey {
    public static let defaultValue: CGFloat = 0.5
}
