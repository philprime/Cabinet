//
//  String+Truncation.swift
//  Cabinet
//
//  Created by Philip Niedertscheider on 21.02.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//

extension String {

    /// Defines where to truncate a string
    public enum TruncatingPosition {
        /// Start with three dots
        case lead

        /// Insert three dots in the middle  of the string
        case middle

        /// End with three dots
        case tail
    }

    /// Truncates a given string after the given `length` based on the rule set by the `position `.
    ///
    /// If the string in `self` is shorter than the given `length`, it won't be truncated
    ///
    /// - Parameters:
    ///   - length: Length of result string
    ///   - position: Defines where to truncate the string, see `TruncatingPosition`
    /// - Returns: Truncated version of self
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
