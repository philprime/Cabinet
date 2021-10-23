public extension Collection {

    /// Returns `nil` if collection is empty
    public var nilIfEmpty: Self? {
        isEmpty ? nil : self
    }
}
