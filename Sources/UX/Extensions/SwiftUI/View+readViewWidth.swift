import SwiftUI



// MARK: - READ SIZE (MAX WIDTH) -

fileprivate struct ViewWidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        let next = nextValue()
        if next > value {
            value = next
        }
    }
}

fileprivate struct ViewWidthPreferenceViewModifier: ViewModifier {
    let onChange: (CGFloat) -> ()
    func body(content: Content) -> some View {
        content
            .background(background)
            .onPreferenceChange(ViewWidthPreferenceKey.self, perform: onChange)
    }
    private var background: some View {
        GeometryReader { geo in
            Color.clear.preference(key: ViewWidthPreferenceKey.self, value: geo.size.width)
        }
    }
}

extension View {
    public func readViewWidth(onChange: @escaping (CGFloat) -> ()) -> some View {
        return modifier(ViewWidthPreferenceViewModifier(onChange: onChange))
    }
}
