//
//  UUID.swift
//  Cabinet
//
//  Created by Philip Niedertscheider on 21.02.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//

import Darwin

public struct UUID {

    /// Universally unique identifier
    public let uuidString: String

    /// Initialises a new UUID string using `C`-level uuid generation functions
    public init() {
        var uu = [UInt8](repeating: 0, count: 16)
        uuid_generate(&uu)
        var out = [Int8](repeating: 8, count: 36)
        uuid_unparse(&uu, &out)
        uuidString = String(bytes: out.map(UInt8.init), encoding: String.Encoding.utf8)!
    }
}
