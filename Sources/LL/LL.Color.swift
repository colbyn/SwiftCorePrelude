//
//  LL.Color.swift
//  
//
//  Created by Colbyn Wadman on 10/20/23.
//

import Foundation
import struct SwiftUI.Color

#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif


#if os(iOS)
extension LL {
    public typealias Color = UIKit.UIColor
}
#elseif os(macOS)
extension LL {
    public typealias Color = AppKit.NSColor
}
#endif

public typealias LLColor = LL.Color

public extension LL.Color {
    var asColor: SwiftUI.Color { SwiftUI.Color(self) }
}

public extension LL.Color {
    func mix(fraction amount: CGFloat, of target: LL.Color) -> Self {
        var r1: CGFloat = 0, g1: CGFloat = 0, b1: CGFloat = 0, a1: CGFloat = 0
        var r2: CGFloat = 0, g2: CGFloat = 0, b2: CGFloat = 0, a2: CGFloat = 0
        
        getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        target.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        
        return Self(
            red: r1 * (1.0 - amount) + r2 * amount,
            green: g1 * (1.0 - amount) + g2 * amount,
            blue: b1 * (1.0 - amount) + b2 * amount,
            alpha: a1
        )
    }
}


public extension Color {
    func mix(fraction amount: CGFloat, of target: Color) -> Color {
        Color(LL.Color(self).mix(fraction: amount, of: LL.Color(target)))
    }
}
