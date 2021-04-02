public extension Collection {

    /// Returns `nil` if collection is empty
    var nilIfEmpty: Self? {
        isEmpty ? nil : self
    }
}
