import Foundation

@propertyWrapper public struct UserDefault<Value> {

    private let key: String
    public var defaultValue: Value
    public var storage: UserDefaults

    public init(_ key: String, defaultValue: Value, storage: UserDefaults = .standard) {
        self.key = key
        self.defaultValue = defaultValue
        self.storage = storage
    }

    public init<Key: RawRepresentable>(
        _ key: Key, defaultValue: Value,
        storage: UserDefaults = .standard
    ) where Key.RawValue == String {
        self.key = key.rawValue
        self.defaultValue = defaultValue
        self.storage = storage
    }

    public var wrappedValue: Value {
        get {
            if type(of: Value.self) == Bool.Type.self {
                return storage.bool(forKey: key) as? Value ?? defaultValue
            } else if type(of: Value.self) == Optional<Bool>.Type.self {
                guard storage.object(forKey: key) != nil else {
                    return defaultValue
                }
                return storage.bool(forKey: key) as? Value ?? defaultValue
            } else if type(of: Value.self) == Data.Type.self || type(of: Value.self) == Optional<Data>.Type.self {
                return storage.data(forKey: key) as? Value ?? defaultValue
            } else if type(of: Value.self) == Int.Type.self || type(of: Value.self) == Optional<Int>.Type.self {
                return storage.integer(forKey: key) as? Value ?? defaultValue
            } else if type(of: Value.self) == Double.Type.self || type(of: Value.self) == Optional<Double>.Type.self {
                return storage.double(forKey: key) as? Value ?? defaultValue
            } else if type(of: Value.self) == Float.Type.self || type(of: Value.self) == Optional<Float>.Type.self {
                return storage.float(forKey: key) as? Value ?? defaultValue
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
