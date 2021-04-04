extension Sequence {

    /// Returns a sequence with duplicate elements removed, performing the comparison usinig the property at
    /// the supplied keypath.
    ///
    /// i.e.
    ///
    /// ```
    /// [
    ///   MyStruct(value: "Hello"),
    ///   MyStruct(value: "Hello"),
    ///   MyStruct(value: "World")
    ///  ].uniqued(\.value)
    /// ```
    /// would result in
    ///
    /// ```
    /// [
    ///   MyStruct(value: "Hello"),
    ///   MyStruct(value: "World")
    /// ]
    /// ```
    ///
    /// - note: Source: stackoverflow.com/a/46354989/3141234
    ///
    public func unique<T: Equatable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        self.unique(by: { $0[keyPath: keyPath] == $1[keyPath: keyPath] })
    }
}

extension Sequence {

    /// Return the sequence with all duplicates removed.
    ///
    /// Duplicate, in this case, is defined as returning `true` from `comparator`.
    ///
    /// - Parameter comparator: A comparison closure. `comparator` accepts two elements of
    ///   this sequence as its parameter and returns a truthy boolean if the two elements have the same identifier
    /// - Returns: A sequence containing only elements uniquely identified by the given comparator
    /// - Note: Source: stackoverflow.com/a/46354989/3141234
    public func unique(by comparator: @escaping (Element, Element) throws -> Bool) rethrows -> [Element] {
        var buffer: [Element] = []

        for element in self {
            // If element is already in buffer, skip to the next element
            if try buffer.contains(where: { try comparator(element, $0) }) {
                continue
            }

            buffer.append(element)
        }

        return buffer
    }
}
