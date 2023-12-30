import SwiftUI

extension Binding {
    public static func proxy(_ source: Binding<Value>) -> Binding<Value> {
        self.init(
            get: { source.wrappedValue },
            set: { source.wrappedValue = $0 }
        )
    }
    public static func forceProxy(_ source: Binding<Value?>) -> Binding<Value> {
        self.init(
            get: {
                assert(source.wrappedValue != nil)
                return source.wrappedValue!
            },
            set: {
                source.wrappedValue = $0
            }
        )
    }
    public static func initSome(_ source: Binding<Value>) -> Binding<Value?> {
        return Binding<Value?>(
            get: {
                let result: Value = source.wrappedValue
                return result
            },
            set: { newValue in
                if let newValue = newValue {
                    source.wrappedValue = newValue
                }
            }
        )
    }
}


extension Binding {
    public func isoMap<T>(
        forward: @escaping (Value) -> T,
        backward: @escaping (T) -> Value
    ) -> Binding<T> {
        Binding<T>.init(
            get: {
                forward(self.wrappedValue)
            },
            set: { newValue in
                self.wrappedValue = backward(newValue)
            }
        )
    }
    public static func newIsoMap<T>(
        given: Binding<Value>,
        forward: @escaping (Value) -> T,
        backward: @escaping (T) -> Value
    ) -> Binding<T> {
        Binding<T>.init(
            get: {
                forward(given.wrappedValue)
            },
            set: { newValue in
                given.wrappedValue = backward(newValue)
            }
        )
    }
    public static func newOptionalIsoMap<T, U>(
        given: Binding<Value>,
        forward: @escaping (T) -> U,
        backward: @escaping (U) -> T
    ) -> Binding<Optional<U>> where Value == Optional<T> {
        Binding.newIsoMap(
            given: given,
            forward: { x in
                if let a = x {
                    return .some(forward(a))
                }
                return .none
            },
            backward: { y in
                if let a = y {
                    return .some(backward(a))
                }
                return .none
            }
        )
    }
    //    public func mapSome<T, U>(forward: @escaping (Binding<T>) -> U) -> Optional<U> where Value == Optional<T> {
    //
    //    }
}

