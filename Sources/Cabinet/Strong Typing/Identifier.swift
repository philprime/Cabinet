public struct Identifier<Owner, Value: Hashable & Codable>: Codable, Hashable {

    public let value: Value

    // MARK: - Initalizer

    public init(_ value: Value) {
        self.value = value
    }

    // MARK: - Codable

    public init(from decoder: Decoder) throws {
        value = try Value(from: decoder)
    }

    public func encode(to encoder: Encoder) throws {
        try value.encode(to: encoder)
    }

    // MARK: - Constants

    public static var uuid: Identifier<Owner, String> {
        .init(UUID().uuidString)
    }
}
