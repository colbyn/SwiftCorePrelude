import Foundation
import CoreGraphics
import LL

extension UX {
    public struct HSBA: Codable {
        public var hue: Double
        public var saturation: Double
        public var brightness: Double
        public var alpha: Double
        @inlinable
        public init(hue: Double, saturation: Double, brightness: Double, alpha: Double) {
            self.hue = hue
            self.saturation = saturation
            self.brightness = brightness
            self.alpha = alpha
        }
        @inlinable
        public init(from color: LLColor) {
            self = color.hsba
        }
        @inlinable
        public init(from color: () -> LLColor) {
            self = color().hsba
        }
    }
}

extension UX.HSBA {
    public var asLLColor: LLColor {
        LLColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
}
