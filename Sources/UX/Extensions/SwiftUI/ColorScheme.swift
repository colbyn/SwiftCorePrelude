import Foundation
import enum SwiftUI.ColorScheme
import LL


#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

extension ColorScheme {
#if os(iOS)
    init?(from userInterfaceStyle: UIUserInterfaceStyle) {
        switch userInterfaceStyle {
        case .light:
            self = .light
        case .dark:
            self = .dark
        case .unspecified: return nil
        @unknown default: return nil
        }
    }
    init?(from traits: UITraitCollection) {
        switch traits.userInterfaceStyle {
        case .light:
            self = .light
        case .dark:
            self = .dark
        case .unspecified: return nil
        @unknown default: return nil
        }
    }
#elseif os(macOS)
    init?(from appearance: NSAppearance) {
        if appearance.bestMatch(from: [.aqua, .darkAqua, .vibrantDark]) == .darkAqua {
            self = .dark
        } else {
            self = .light
        }
    }
#endif
}

extension ColorScheme {
    init?(from view: LL.View) {
#if os(iOS)
        if let colorScheme = ColorScheme.init(from: UITraitCollection.current.userInterfaceStyle) {
            self = colorScheme
        } else {
            return nil
        }
#elseif os(macOS)
        if let colorScheme = ColorScheme.init(from: view.appearance ?? view.effectiveAppearance) {
            self = colorScheme
        } else {
            return nil
        }
#endif
    }
}

extension ColorScheme {
    public var isDarkMode: Bool { self == .dark }
    public var isLightMode: Bool { self == .light }
    public var inverted: ColorScheme {
        switch self {
        case .light: return ColorScheme.dark
        case .dark: return ColorScheme.light
        @unknown default: return ColorScheme.dark
        }
    }
}


