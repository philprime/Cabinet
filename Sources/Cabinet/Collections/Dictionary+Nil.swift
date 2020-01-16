extension Dictionary where Key == String, Value == String? {

    public var trimmingNullValues: [String: String] {
        return self.compactMapValues({ $0 })
    }
}
