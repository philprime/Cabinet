extension UserDefault where Value == Bool {

    /// Creates a UserDefaults wrapper with a default value of `false`
    ///
    /// - Parameter key: key of stored value
    public init(_ key: String) {
        self.init(key, defaultValue: false)
    }
}
