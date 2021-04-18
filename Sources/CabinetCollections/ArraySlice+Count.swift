//
//  ArraySlice+Count.swift
//  Cabinet
//
//  Created by Philip Niedertscheider on 25.09.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//

extension ArraySlice {

    @inlinable public func count(where predicate: (Element) throws -> Bool) rethrows -> Int {
        try self.filter(predicate).count
    }
}
