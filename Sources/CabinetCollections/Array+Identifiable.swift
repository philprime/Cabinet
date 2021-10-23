//
//  Array+Exclude.swift
//
//
//  Created by Philip Niedertscheider on 01.07.20.
//

@available(iOS 13, macOS 10.15, tvOS 13, *)
public extension Array where Element: Identifiable {

    /// Finds the first element where the `id` equals the `id` of the given object `other`.
    ///
    /// - Parameter other: Other element which conforms to `Identifiable`
    /// - Returns: The first element of the sequence that has the same `id`,
    ///            or nil if there is no element has the same `id`.
    func first<T>(byId other: T) -> Element? where T: Identifiable, T.ID == Element.ID {
        self.first { element -> Bool in
            element.id == other.id
        }
    }
}
