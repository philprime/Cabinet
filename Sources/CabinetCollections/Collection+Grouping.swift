extension Collection {

    public func grouped<Key>(by grouping: (Element) -> Key) -> [Key: [Element]] {
        Dictionary(grouping: self, by: grouping)
    }
}
