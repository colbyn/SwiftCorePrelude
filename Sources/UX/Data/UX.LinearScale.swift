import Foundation
import CoreGraphics

extension UX {
    public struct LinearScale {
        public let domain: MinMax
        public let range: MinMax
        @inlinable
        public init(domain: MinMax, range: MinMax) {
            self.domain = domain
            self.range = range
        }
        public struct MinMax {
            public let min: Double
            public let max: Double
            @inlinable
            public init(min: Double, max: Double) {
                self.min = min
                self.max = max
            }
        }
    }
    public struct LinearScale2D {
        public let domain: MinMax
        public let range: MinMax
        @inlinable
        public init(domain: MinMax, range: MinMax) {
            self.domain = domain
            self.range = range
        }
        public struct MinMax {
            public let xMin: Double
            public let xMax: Double
            public let yMin: Double
            public let yMax: Double
            @inlinable
            public init(xMin: Double, xMax: Double, yMin: Double, yMax: Double) {
                self.xMin = xMin
                self.xMax = xMax
                self.yMin = yMin
                self.yMax = yMax
            }
        }
    }
}

extension UX.LinearScale {
    @inlinable
    public func apply(_ value: Double) -> Double {
        let minDomain = self.domain.min
        let maxDomain = self.domain.max
        let minRange = self.range.min
        let maxRange = self.range.max
        return (maxRange - minRange) * (value - minDomain) / (maxDomain - minDomain) + minRange
    }
    @inlinable
    public func callAsFunction(_ value: Double) -> Double {
        apply(value)
    }
}

extension UX.LinearScale2D {
    @inlinable
    public func apply(_ value: CGPoint) -> CGPoint {
        let xScale = UX.LinearScale(
            domain: .init(min: self.domain.xMin, max: self.domain.xMax),
            range: .init(min: self.range.xMin, max: self.range.xMax)
        )
        let yScale = UX.LinearScale(
            domain: .init(min: self.domain.yMin, max: self.domain.yMax),
            range: .init(min: self.range.yMin, max: self.range.yMax)
        )
        return CGPoint(
            x: xScale.apply(value.x),
            y: yScale.apply(value.y)
        )
    }
    @inlinable
    public func callAsFunction(_ value: CGPoint) -> CGPoint {
        apply(value)
    }
}

extension CGPoint {
    @inlinable
    public func scale(xAxis scale: UX.LinearScale) -> CGPoint {
        CGPoint(x: scale(x), y: y)
    }
    @inlinable
    public func scale(_ scale: UX.LinearScale2D) -> CGPoint { scale.apply(self) }
}
