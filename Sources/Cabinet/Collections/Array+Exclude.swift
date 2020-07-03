//
//  Array+Exclude.swift
//  
//
//  Created by Philip Niedertscheider on 01.07.20.
//

import Flow

public extension Array where Element: Equatable {

    func exclude(_ other: Array<Element>) -> Array<Element> {
        self.filter(not(other.contains))
    }
}
