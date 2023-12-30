import Foundation
import SwiftUI
import LL

extension UX {
    public struct ColorMap<ColorType> {
        public var light: ColorType
        public var dark: ColorType
        @inlinable
        public init(light: ColorType, dark: ColorType) {
            self.light = light
            self.dark = dark
        }
        @inlinable
        public init(light: () -> ColorType, dark: () -> ColorType) {
            self.light = light()
            self.dark = dark()
        }
        @inlinable
        public init(singleton color: ColorType) {
            self.light = color
            self.dark = color
        }
        @inlinable
        public init(singleton color: () -> ColorType) {
            self.light = color()
            self.dark = color()
        }
        @inlinable
        public func apply(colorScheme: ColorScheme) -> ColorType {
            switch colorScheme {
            case .light: return self.light
            case .dark: return self.dark
            default: return self.light
            }
        }
        @inlinable
        public func callAsFunction(colorScheme: ColorScheme) -> ColorType {
            self.apply(colorScheme: colorScheme)
        }
        @inlinable
        public func with(light: ColorType) -> Self {
            ColorMap(light: light, dark: dark)
        }
        @inlinable
        public func with(dark: ColorType) -> Self {
            ColorMap(light: light, dark: dark)
        }
        @inlinable
        public static func evaluate(
            colorScheme: ColorScheme,
            light: ColorType,
            dark: ColorType
        ) -> ColorType {
            Self(light: light, dark: dark).apply(colorScheme: colorScheme)
        }
        @inlinable
        public var inverse: Self {
            Self(light: self.dark, dark: self.light)
        }
    }
}



public typealias HSBAColorMap = UX.ColorMap<UX.HSBA>
public typealias LLColorMap = UX.ColorMap<LLColor>

extension LLColorMap {
    public static let `default`: LLColorMap = LLColorMap.init(light: LLColor.black, dark: LLColor.white)
    public static let red = LLColorMap(
        light: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1),
        dark: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    )
    public static let green = LLColorMap(
        light: #colorLiteral(red: 0.2778122788, green: 0.6918070885, blue: 0, alpha: 1),
        dark: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    )
    public static let selection = LLColorMap(
        light: #colorLiteral(red: 0, green: 0.3639292903, blue: 1, alpha: 1),
        dark: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    )
    public static let clear: LLColorMap = LLColorMap(light: LLColor.clear, dark: LLColor.clear)
    public static let UNNOTICEABLE_BG: LLColorMap = LLColorMap(
        light: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.01),
        dark: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.01235708773)
    )
}
