public struct ArbitaryCodingKey: CodingKey, Equatable {

    public var intValue: Int?
    public var stringValue: String

    public init(_ intValue: Int) {
        self.init(intValue: intValue)
    }

    public init(intValue: Int) {
        self.intValue = intValue
        self.stringValue = intValue.description
    }

    public init(_ stringValue: String) {
        self.init(stringValue: stringValue)
    }

    public init(stringValue: String) {
        self.stringValue = stringValue
    }

    // MARK: - Equatable

    public static func == (lhs: ArbitaryCodingKey, rhs: ArbitaryCodingKey) -> Bool {
        lhs.stringValue == rhs.stringValue && lhs.intValue == rhs.intValue
    }
}
