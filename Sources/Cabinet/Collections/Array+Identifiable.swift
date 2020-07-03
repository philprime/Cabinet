//
//  Array+Exclude.swift
//
//
//  Created by Philip Niedertscheider on 01.07.20.
//

@available(OSX 10.15, *)
public extension Array where Element: Identifiable {

    func first(where other: Element) -> Element? {
        self.first { element -> Bool in
            element.id == other.id
        }
    }
}
