//
//  Array+Exclude.swift
//
//
//  Created by Philip Niedertscheider on 01.07.20.
//

@available(OSX 10.15, *)
public extension Array where Element: Identifiable {

    func first<T>(byId other: T) -> Element? where T: Identifiable, T.ID == Element.ID {
        self.first { element -> Bool in
            element.id == other.id
        }
    }
}
