import Foundation
import CoreGraphics
import LL

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

extension UX {
    public struct RGBA {
        public var red: CGFloat
        public var green: CGFloat
        public var blue: CGFloat
        public var alpha: CGFloat
        @inlinable
        public init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
            self.red = red
            self.green = green
            self.blue = blue
            self.alpha = alpha
        }
        @inlinable
        public init(from color: LLColor) {
            self = color.rgba
        }
    }
}

extension UX.RGBA {
    @inlinable
    public var asLLColor: LLColor {
        LLColor(
            red: self.red,
            green: self.green,
            blue: self.blue,
            alpha: self.alpha
        )
    }
    @inlinable
    public var asCGColor: CGColor { self.asLLColor.cgColor }
}
