import Foundation

@propertyWrapper public struct UserDefault<Value> {

    private let key: String
    private let defaultValue: Value
    private let storage: UserDefaults

    public init(_ key: String, defaultValue: Value, storage: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.storage = storage
    }

    public init<Key: RawRepresentable>(_ key: Key, defaultValue: Value, storage: UserDefaults = .standard) where Key.RawValue == String {
        self.key = key.rawValue
        self.defaultValue = defaultValue
        self.storage = storage
    }

    public var wrappedValue: Value {
        get {
            if type(of: Value.self) == Bool.self {
                return storage.bool(forKey: key) as? Value ?? defaultValue
            } else if type(of: Value.self) == Data.self {
                return storage.data(forKey: key) as? Value ?? defaultValue
            } else if type(of: Value.self) == Int.self {
                return storage.integer(forKey: key) as? Value ?? defaultValue
            }
            return storage.object(forKey: key) as? Value ?? defaultValue
        }
        set {
            if let optional = newValue as? AnyOptional, optional.isNil {
                storage.removeObject(forKey: key)
            } else {
                storage.set(newValue, forKey: key)
            }
            storage.synchronize()
        }
    }
}

extension UserDefault where Value: ExpressibleByNilLiteral {

    /// Convenience initalizer for nil-able values.
    ///
    /// Using this initializer it is not necessary to set a `defaultValue` of `nil`.
    ///
    /// - Parameter key: Key for locating value in storage
    public init(_ key: String) {
        self.init(key, defaultValue: nil)
    }

    /// Convenience initalizer for nil-able values.
    ///
    /// Using this initializer it is not necessary to set a `defaultValue` of `nil`.
    ///
    /// - Parameter key: Key for locating value in storage
    public init<Key: RawRepresentable>(_ key: Key) where Key.RawValue == String {
        self.init(key, defaultValue: nil)
    }
}
