import SwiftUI
import LL

fileprivate struct ViewColorModifier: ViewModifier {
    let fgColorMap: LLColorMap?
    let bgColorMap: LLColorMap?
    @Environment(\.colorScheme) private var colorScheme
    func body(content: Content) -> some View {
        switch (fgColorMap, bgColorMap) {
        case (.some(let fg), .some(let bg)):
            content
                .foregroundColor(fg.apply(colorScheme: colorScheme).asColor)
                .background(bg.apply(colorScheme: colorScheme).asColor)
        case (.none, .some(let bg)):
            content.background(bg.apply(colorScheme: colorScheme).asColor)
        case (.some(let fg), .none):
            content.foregroundColor(fg.apply(colorScheme: colorScheme).asColor)
        case (.none, .none):
            content
        }
    }
}

extension View {
    public func color(foreground: LLColorMap?) -> some View {
        modifier(ViewColorModifier(fgColorMap: foreground, bgColorMap: nil))
    }
    public func color(background: LLColorMap?) -> some View {
        modifier(ViewColorModifier(fgColorMap: nil, bgColorMap: background))
    }
    public func color(background: LLColorMap?, foreground: LLColorMap?) -> some View {
        modifier(ViewColorModifier(fgColorMap: foreground, bgColorMap: background))
    }
}
