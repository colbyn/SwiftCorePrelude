import SwiftUI

extension UX {
    public struct OptBindingGuard<T, V: View>: View {
        @Binding var data: T?
        let view: (Binding<T>) -> V
        
        public init(binding: Binding<T?>, @ViewBuilder view: @escaping (Binding<T>) -> V) {
            _data = binding
            self.view = view
        }
        public var body: some View {
            let state = $data
            if state.wrappedValue.isSome {
                view(Binding.forceProxy(state))
            }
        }
    }
}

extension UX {
    public struct BindingGuard<T, Content: View, Fallback: View>: View {
        @Binding var data: T?
        let content: (Binding<T>) -> Content
        let fallback: () -> Fallback
        
        public init(
            binding: Binding<T?>,
            @ViewBuilder content: @escaping (Binding<T>) -> Content,
            @ViewBuilder fallback: @escaping () -> Fallback
        ) {
            _data = binding
            self.content = content
            self.fallback = fallback
        }
        public var body: some View {
            let state = $data
            if state.wrappedValue.isSome {
                content(Binding.forceProxy(state))
            } else {
                fallback()
            }
        }
    }
}
