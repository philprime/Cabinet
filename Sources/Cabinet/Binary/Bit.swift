//
//  Bit.swift
//  Cabinet
//
//  Created by Philip Niedertscheider on 19.02.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//

public enum Bit: UInt8, CustomStringConvertible {
    
    case zero
    case one
    
    public var description: String {
        String(self.rawValue)
    }
    
    public var asBool: Bool {
        self == .one
    }
}
