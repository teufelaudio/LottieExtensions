//
//  Asset.swift
//  LottieExtensions
//
//  Created by Luis Reisewitz on 20.05.20.
//

import Foundation

public protocol Asset {
    var filename: String { get }
    var bundle: Bundle { get }
}
