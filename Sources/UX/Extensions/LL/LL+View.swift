import Foundation
import enum SwiftUI.ColorScheme
import LL

#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif


extension LL.View {
    public func getCGContext() -> CGContext? {
#if os(iOS)
        return UIGraphicsGetCurrentContext()
#elseif os(macOS)
        return NSGraphicsContext.current?.cgContext
#endif
    }
//    // TODO: SAFER LOOKUP
//    public func currentColorScheme() -> ColorScheme {
//        ColorScheme(from: self)!
//    }
}
