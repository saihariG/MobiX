//
//  HashSet.swift
//  MobiX
//
//  Created by Sai Hari on 19/04/22.
//

import Foundation

public struct HashSet<String : Hashable> {
    fileprivate var dictionary = Dictionary<String, Bool>()

    public init() {

    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(dictionary)
    }

    public mutating func insert(_ element: String) {
        dictionary[element] = true
    }

    public mutating func remove(_ element: String) {
        dictionary[element] = nil
    }

    public func contains(_ element: String) -> Bool {
        return dictionary[element] != nil
    }

    public func allElements() -> [String] {
        return Array(dictionary.keys)
    }

    public var count: Int {
        return dictionary.count
    }

    public var isEmpty: Bool {
        return dictionary.isEmpty
    }
}
