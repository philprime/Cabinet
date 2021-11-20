public extension String {

    /// Returns `nil` if string is empty
    var nilIfEmpty: String? {
        self.isEmpty ? nil : self
    }
}
