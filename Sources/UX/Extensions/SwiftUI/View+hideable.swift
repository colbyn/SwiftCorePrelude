//
//  File.swift
//  
//
//  Created by Colbyn Wadman on 10/23/23.
//

import SwiftUI

extension View {
    @ViewBuilder public func hideable(hidden: Bool?) -> some View {
        if hidden == true {
            EmptyView()
        } else {
            self
        }
    }
    @ViewBuilder public func hideable(visible: Bool?) -> some View {
        if visible == true {
            self
        } else {
            EmptyView()
        }
    }
}
