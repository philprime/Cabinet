//
//  Array+Safe.swift
//  Cabinet
//
//  Created by Philip Niedertscheider on 12.02.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//

public extension Array {

    /// Returns the element at the given index, or `nil` if the given index is out of bounds.
    subscript(safe idx: Int) -> Element? {
        guard idx >= 0 && idx < count else {
            return nil
        }
        return self[idx]
    }
}
