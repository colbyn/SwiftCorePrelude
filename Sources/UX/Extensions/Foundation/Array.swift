//
//  File.swift
//  
//
//  Created by Colbyn Wadman on 12/29/23.
//

import Foundation

extension Array {
    public func with(append: Element) -> Self {
        var copy = self
        copy.append(append)
        return copy
    }
}
