//
//  Array+Exclude.swift
//  
//
//  Created by Philip Niedertscheider on 01.07.20.
//

import Flow

public extension Array where Element: Equatable {

    /// Excludes all elements in the given array
    ///
    /// - Parameter other: Array of elements which should be excluded
    /// - Returns: Reduced array without the elements in other
    func exclude(_ other: Array<Element>) -> Array<Element> {
        self.filter(not(other.contains))
    }
}
