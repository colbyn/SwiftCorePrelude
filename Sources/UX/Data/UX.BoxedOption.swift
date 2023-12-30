//
//  File.swift
//  
//
//  Created by Colbyn Wadman on 10/25/23.
//

import Foundation
import SwiftData

extension UX {
    public final class BoxedOption<Element>: Observable {
        public var pointer: Optional<Element>
        public init(pointer: Optional<Element>) {
            self.pointer = pointer
        }
    }
}
