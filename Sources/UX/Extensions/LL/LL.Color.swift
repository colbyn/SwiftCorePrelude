import Foundation
import LL

#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

extension LLColor {
    public var rgba: UX.RGBA {
#if os(iOS)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return UX.RGBA(red: red, green: green, blue: blue, alpha: alpha)
#elseif os(macOS)
        let red = self.redComponent;
        let green = self.greenComponent;
        let blue = self.blueComponent;
        let alpha = self.alphaComponent;
        return UX.RGBA(red: red, green: green, blue: blue, alpha: alpha)
#endif
    }
    public var hsba: UX.HSBA {
#if os(iOS)
        var hue: CGFloat = 0.0
        var saturation: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        self.getHue(
            &hue,
            saturation: &saturation,
            brightness: &brightness,
            alpha: &alpha
        )
        return UX.HSBA(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
#elseif os(macOS)
        var hue: CGFloat = 0.0
        var saturation: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        let color = self.usingColorSpace(NSColorSpace.sRGB)!
        color.getHue(
            &hue,
            saturation: &saturation,
            brightness: &brightness,
            alpha: &alpha
        )
        return UX.HSBA(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
#endif
    }
}
