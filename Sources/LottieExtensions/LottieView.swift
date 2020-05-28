//
//  LottieView.swift
//  UIExtensions
//
//  Created by Luiz Barbosa on 15.01.20.
//  Copyright © 2020 Lautsprecher Teufel GmbH. All rights reserved.
//

import Foundation
import Lottie
import SwiftUI
import UIExtensions

public struct LottieView: UIViewRepresentable {
    let animationView = AnimationView()
    let filename: String
    let bundle: Bundle
    let loopMode: LottieLoopMode

    public init(filename: String, bundle: Bundle, loopMode: LottieLoopMode = .playOnce) {
        self.filename = filename
        self.bundle = bundle
        self.loopMode = loopMode
    }

    public func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()
        let animation = Animation.named(filename, bundle: bundle)
        animationView.animation = animation
        animationView.loopMode = loopMode
        animationView.contentMode = .scaleAspectFill
        animationView.backgroundBehavior = .pauseAndRestore
        if context.environment.disableAnimations {
            animationView.currentProgress = 0.5
        } else {
            animationView.play()
        }
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        return view
    }

    public func updateUIView(_ uiView: LottieView.UIViewType, context: UIViewRepresentableContext<LottieView>) {
    }
}
