import Foundation
import enum SwiftUI.ColorScheme

extension LL.View {
#if os(iOS)
    public func currentColorScheme() -> SwiftUI.ColorScheme {
        if self.traitCollection.userInterfaceStyle == .dark {
            return SwiftUI.ColorScheme.dark
        }
        return SwiftUI.ColorScheme.light
    }
#elseif os(macOS)
    public func currentColorScheme() -> SwiftUI.ColorScheme {
        let appearanceName = self.effectiveAppearance.bestMatch(from: [.aqua, .darkAqua])
        if appearanceName == .darkAqua {
            return SwiftUI.ColorScheme.dark
        }
        return SwiftUI.ColorScheme.light
    }
#endif
}
