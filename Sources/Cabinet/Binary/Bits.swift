//
//  Bits.swift
//  Cabinet
//
//  Created by Philip Niedertscheider on 19.02.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//

public class Bits {
    
    private let bits: [Bit]
    
    public init(byte: UInt8) {
        self.bits = Bits.from(byte: byte)
    }
    
    public subscript(_ index: Int) -> Bit {
        return bits[index]
    }
    
    public subscript(fromMSB index: Int) -> Bit {
        return bits[bits.count - 1 - index]
    }
    
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
