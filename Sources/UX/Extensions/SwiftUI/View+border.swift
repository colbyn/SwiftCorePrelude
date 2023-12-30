import SwiftUI
import LL

fileprivate let DEFAULT_FOREGROUND_COLOR = LLColorMap(
    light: #colorLiteral(red: 0.665412033, green: 0.7165975681, blue: 0.788257317, alpha: 0.5),
    dark: #colorLiteral(red: 0.4284313075, green: 0.4284313075, blue: 0.4284313075, alpha: 1)
)
fileprivate let DEFAULT_BACKGROUND_COLOR = LLColorMap(
    light: #colorLiteral(red: 0.9770826317, green: 0.9770826317, blue: 0.9770826317, alpha: 1),
    dark: #colorLiteral(red: 0.4284313075, green: 0.4284313075, blue: 0.4284313075, alpha: 1)
)
fileprivate let DEFAULT_LINE_WIDTH: CGFloat = 1.0
fileprivate let DEFAULT_CORNER_RADIUS: CGFloat = 5.0
fileprivate let DEFAULT_PADDING = EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

fileprivate struct StyledView: ViewModifier {
    let foreground: LLColorMap?
    let background: LLColorMap?
    let lineWidth: CGFloat?
    let cornerRadius: CGFloat?
    let padding: EdgeInsets?
    @Environment(\.colorScheme) private var colorScheme
    func body(content: Content) -> some View {
        let foreground = (foreground ?? DEFAULT_FOREGROUND_COLOR)
            .apply(colorScheme: colorScheme).asColor
        let background = (background ?? DEFAULT_BACKGROUND_COLOR)
            .apply(colorScheme: colorScheme).asColor
        let lineWidth = lineWidth ?? DEFAULT_LINE_WIDTH
        let cornerRadius = cornerRadius ?? DEFAULT_CORNER_RADIUS
        let padding = padding ?? DEFAULT_PADDING
        let shape = RoundedRectangle(cornerRadius: cornerRadius)
        content
            .padding(padding)
            .background(shape.fill().foregroundStyle(background))
            .overlay(shape.stroke(foreground, lineWidth: lineWidth))
    }
}

extension View {
    public func roundedRect(
        foreground: LLColorMap? = nil,
        background: LLColorMap? = nil,
        lineWidth: CGFloat? = nil,
        cornerRadius: CGFloat? = nil,
        padding: EdgeInsets? = nil
    ) -> some View {
        modifier(
            StyledView(
                foreground: foreground,
                background: background,
                lineWidth: lineWidth,
                cornerRadius: cornerRadius,
                padding: padding
            )
        )
    }
}
