/// Infix operator for merging two dictionaries
infix operator +~

/// Merges two dictionary using `Dictionary.combine(_:)`
///
/// - Parameters:
///   - lhs: Base dictionary
///   - rhs: Other dictionary which should be merged with the base one.
public func +~<K,V>(lhs: inout Dictionary<K, V>, rhs: Dictionary<K, V>) {
    lhs = lhs.combine(rhs)
}

extension Dictionary {

    /// Returns the combination with the `other` dictionary.
    ///
    /// If a key exists in both, the value in `other` wins and is used./
    ///
    /// - Parameter other: Another dictionary with the same type which should merged into a new one
    /// - Returns: New dictionary holding the merge result of `self` and `other`
    public func combine(_ other: Dictionary) -> Dictionary {
        return self.merging(other, uniquingKeysWith: { (lhs, rhs) in rhs })
    }
}
