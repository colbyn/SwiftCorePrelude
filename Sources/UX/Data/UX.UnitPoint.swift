import Foundation

extension UX {
    public struct UnitPoint {
        public let x: Double
        public let y: Double
    }
}

extension UX.UnitPoint {
    public static let topLeft: UX.UnitPoint = UX.UnitPoint(x: 0, y: 0)
    public static let topRight: UX.UnitPoint = UX.UnitPoint(x: 1, y: 0)
    public static let bottomLeft: UX.UnitPoint = UX.UnitPoint(x: 0, y: 1)
    public static let bottomRight: UX.UnitPoint = UX.UnitPoint(x: 1, y: 1)
    public static let center: UX.UnitPoint = UX.UnitPoint(x: 0.5, y: 0.5)
    public static func center(x: Double) -> Self {
        UX.UnitPoint(x: x, y: 0.5)
    }
    public static func center(y: Double) -> Self {
        UX.UnitPoint(x: 0.5, y: y)
    }
}

extension UX.UnitPoint {
    func convert(scale: UX.LinearScale2D) -> CGPoint {
        scale.apply(CGPoint(x: x, y: y))
    }
}

