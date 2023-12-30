import Foundation
import struct SwiftUI.Angle

extension UX {
    public struct Turn: Codable {
        private var fraction: Double
        public init(fraction: Double) {
            self.fraction = fraction
        }
    }
}

// MARK: - BASICS -
extension UX.Turn {
    public static func +(lhs: UX.Turn, rhs: UX.Turn) -> UX.Turn {
        return UX.Turn(fraction: lhs.fraction + rhs.fraction)
    }
    public static func -(lhs: UX.Turn, rhs: UX.Turn) -> UX.Turn {
        return UX.Turn(fraction: lhs.fraction - rhs.fraction)
    }
    public static func <(lhs: UX.Turn, rhs: UX.Turn) -> Bool {
        return lhs.fraction < rhs.fraction
    }
    public static func <=(lhs: UX.Turn, rhs: UX.Turn) -> Bool {
        return lhs.fraction <= rhs.fraction
    }
}

// Make Turn conform to Comparable
extension UX.Turn: Comparable {}

// MARK: - CONVERSION -
extension UX.Turn {
    var radians: Double {
        return fraction * 2 * Double.pi
    }
    var degrees: Double {
        return fraction * 360.0
    }
    var angle: SwiftUI.Angle {
        SwiftUI.Angle(radians: degrees)
    }
}

// MARK: - CONSTRUCTION -
extension UX.Turn {
    public static func from(radians: Double) -> Self {
        UX.Turn(fraction: radians / (2 * Double.pi))
    }
    public static func from(degrees: Double) -> Self {
        UX.Turn(fraction: degrees / 360.0)
    }
}

