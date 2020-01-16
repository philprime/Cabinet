infix operator +~
public func +~<K,V>(lhs: inout Dictionary<K, V>, rhs: Dictionary<K, V>) {
    lhs = lhs.combine(rhs)
}

extension Dictionary {

    public func combine(_ other: Dictionary) -> Dictionary {
        return self.merging(other, uniquingKeysWith: { (lhs, rhs) in rhs })
    }
}
