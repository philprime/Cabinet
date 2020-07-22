//
//  Bits.swift
//  Cabinet
//
//  Created by Philip Niedertscheider on 19.02.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//

/// Collection of multiple bits
public class Bits {

    /// :nodoc:
    private let bits: [Bit]

    /// Creates a new instance based on the binary representation of the given variable
    /// - Parameter byte: Value to represent
    public init(byte: UInt8) {
        self.bits = Bits.from(byte: byte)
    }

    /// Returns the bit at the given position, starting at the least significant bit
    ///
    /// **Example:**
    ///
    ///     let byte = Bits(byte: 0b1100)
    ///     byte[0] == .zero
    ///     byte[1] == .zero
    ///     byte[2] == .one
    ///     byte[3] == .one
    public subscript(_ index: Int) -> Bit {
        return bits[index]
    }

    /// Returns the bit at the given position, starting at the most significant bit
    ///
    /// **Example:**
    ///
    ///     let byte = Bits(byte: 0b1100)
    ///     byte[0] == .one
    ///     byte[1] == .one
    ///     byte[2] == .zero
    ///     byte[3] == .zero
    public subscript(fromMSB index: Int) -> Bit {
        return bits[bits.count - 1 - index]
    }

    /// Creates an array of bits, representing the given value
    ///
    /// - Parameter byte: Value to represent
    /// - Returns: Array of bits
    public static func from(byte: UInt8) -> [Bit] {
        var byte = byte
        var bits = [Bit](repeating: .zero, count: 8)
        for i in 0..<8 {
            if byte & 0x01 != 0 {
                bits[i] = .one
            }
            byte >>= 1
        }
        return bits
    }
}
