//
//  Color+Ext.swift
//  FlickNest
//
//  Created by Goldianus Solangius on 13/01/24.
//

import SwiftUI

extension Color {
    init(hex: UInt) {
        self.init(
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 8) & 0xff) / 255,
            blue: Double(hex & 0xff) / 255
        )
    }
}
