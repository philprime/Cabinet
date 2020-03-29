//
//  String+Truncation.swift
//  Cabinet
//
//  Created by Philip Niedertscheider on 21.02.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//

extension String {
    
    public enum TruncatingPosition {
        case lead
        case middle
        case tail
    }
    
    public func truncated(to length: Int, at position: TruncatingPosition = .lead) -> String {
        guard self.count > length else {
            return self
        }
        switch position {
        case .lead:
            let index = self.index(self.endIndex, offsetBy: -length + 3)
            return "..." + String(self[index...])
        case .middle:
            let lengthPerSide = (length - 3) / 2
            let firstHalfEndIdex = self.index(self.startIndex, offsetBy: lengthPerSide)
            let secondHalfStartIndex = self.index(self.endIndex, offsetBy: -lengthPerSide)
            return String(self[...firstHalfEndIdex]) + "..." + String(self[secondHalfStartIndex...])
        case .tail:
            let index = self.index(self.startIndex, offsetBy: length - 3)
            return String(self[...index]) + "..."
        }
    }
}
