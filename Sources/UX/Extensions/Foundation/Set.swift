//
//  Set.swift
//  
//
//  Created by Colbyn Wadman on 12/29/23.
//

import Foundation

extension Set {
    mutating public func toggle(element: Self.Element) {
        if self.contains(element) {
            self.remove(element)
        } else {
            self.insert(element)
        }
    }
}
