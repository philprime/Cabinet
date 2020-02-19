//
//  UnsignedInteger+Bytes.swift
//  Cabinet
//
//  Created by Philip Niedertscheider on 19.02.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//

public extension UnsignedInteger {
    
    init(_ bytes: [UInt8]) {
        precondition(bytes.count <= MemoryLayout<Self>.size)
        
        let value = bytes.reduce(0, { (value, byte) in
            (value << 8) | UInt64(byte)
        })
        
        self.init(value)
    }
}
