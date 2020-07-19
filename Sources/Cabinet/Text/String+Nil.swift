//
//  File.swift
//  
//
//  Created by Philip Niedertscheider on 03.07.20.
//

public extension String {

    /// Returns `nil` if string is empty
    var nilIfEmpty: String? {
        self.isEmpty ? nil : self
    }
}
