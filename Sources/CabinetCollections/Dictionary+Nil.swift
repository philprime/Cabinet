extension Dictionary where Key == String, Value == String? {

    /// Returns a new dictionary whithout `nil` values.
    public var trimmingNullValues: [String: String] {
        self.compactMapValues({ $0 })
    }
}
