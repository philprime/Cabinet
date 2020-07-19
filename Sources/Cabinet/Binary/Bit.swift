//
//  Bit.swift
//  Cabinet
//
//  Created by Philip Niedertscheider on 19.02.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//


/// Represents a binary flag, either `.zero` or `.one`
public enum Bit: UInt8, CustomStringConvertible {

    /// :nodoc:
    case zero

    /// :nodoc:
    case one

    /// :nodoc:
    public var description: String {
        String(self.rawValue)
    }

    /// Converts the value of this bit as a boolean value
    ///
    /// Returns `true` if `one`, otherwise `false`
    public var asBool: Bool {
        self == .one
    }
}
