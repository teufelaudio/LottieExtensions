//
//  LottieAsset.swift
//  UIExtensions
//
//  Created by Luiz Barbosa on 04.06.20.
//  Copyright © 2020 Lautsprecher Teufel GmbH. All rights reserved.
//

import Foundation

public protocol LottieAsset {
    var filename: String { get }
    var bundle: Bundle { get }
}
