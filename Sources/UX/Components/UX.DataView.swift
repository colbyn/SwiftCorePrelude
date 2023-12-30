//
//  File.swift
//  
//
//  Created by Colbyn Wadman on 10/24/23.
//

import SwiftUI
import SwiftData

extension UX {
    public struct DataView {
        public struct QueryFirstEntityView<Element : PersistentModel, Content: View> {
            private let content: (Element) -> Content
            @Query private let query: [Element]
        }
        public struct QueryView<Element : PersistentModel, Content: View> {
            @Environment(\.modelContext) private var modelContext
            private let content: (Query<Element, [Element]>) -> Content
            @Query private let query: [Element]
        }
    }
}
extension UX.DataView.QueryFirstEntityView: View {
    public init(
        for: Element.Type,
        where pred: Predicate<Element>,
        @ViewBuilder content: @escaping (Element) -> Content
    ) {
        self._query = Query(filter: pred)
        self.content = content
    }
    public var body: some View {
        if let first = query.first {
            content(first)
        } else {
            Text("Failed to load entity.")
        }
    }
}
extension UX.DataView.QueryView: View {
    public init(
        for: Element.Type,
        where pred: Predicate<Element>,
        @ViewBuilder content: @escaping (Query<Element, [Element]>) -> Content
    ) {
        self._query = Query(filter: pred)
        self.content = content
    }
    public init<Value: Comparable>(
        for: Element.Type,
        where pred: Predicate<Element>,
        sort order: KeyPath<Element, Value>,
        @ViewBuilder content: @escaping (Query<Element, [Element]>) -> Content
    ) {
        self._query = Query(filter: pred, sort: order)
        self.content = content
    }
    public init(
        for: Element.Type,
        where pred: Predicate<Element>,
        sort order: [SortDescriptor<Element>] = [],
        @ViewBuilder content: @escaping (Query<Element, [Element]>) -> Content
    ) {
        self._query = Query(filter: pred, sort: order)
        self.content = content
    }
    public var body: some View {
        content(_query)
    }
}


