//
//  Partial.swift
//  Cabinet
//
//  Created by Philip Niedertscheider on 10.02.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//

// swiftlint:disable line_length

/// Utility for type-safe partial class fields
///
/// Concept is very similar to the [one](https://www.typescriptlang.org/docs/handbook/utility-types.html#partialt)
/// implemented in the Javascript superset language TypeScript.
///
/// It constructs a type with all properties of `Wrapped` set to optional.
/// This utility will return a type that represents all subsets of a given type.
public struct Partial<Wrapped> {

    /// Error thrown if using this utility in a invalid way
    public enum Error<ValueType>: Swift.Error {

        /// Type does not have a value for the given `KeyPath`
        case missingKey(KeyPath<Wrapped, ValueType>)

        /// Value set in instance does not conform to the expected type
        case invalidValueType(key: KeyPath<Wrapped, ValueType>, actualValue: Any)

    }

    /// Holds additional data, which overwrites the actual on access with a given KeyPath
    private var values: [PartialKeyPath<Wrapped>: Any?] = [:]

    /// Value to project
    private var backingValue: Wrapped?

    /// Initialises a new partial instance, projecting on the given value
    ///
    /// - Parameter backingValue: Value to project
    public init(backingValue: Wrapped? = nil) {
        self.backingValue = backingValue
    }

    /// Returns or updates the value for the given `key`, might return `nil` if not found or an error is thrown
    public subscript<ValueType>(key: KeyPath<Wrapped, ValueType>) -> ValueType? {
        get {
            return try? value(for: key)
        }
        set {
            values.updateValue(newValue, forKey: key)
        }
    }

    /// Returns or updates the optional value for the given `key`, might return `nil` if not found or an error is thrown
    public subscript<ValueType>(key: KeyPath<Wrapped, ValueType?>) -> ValueType? {
        get {
            return try? value(for: key)
        }
        set {
            values.updateValue(newValue, forKey: key)
        }
    }

    /// Returns the value for the given `key`, but fails if an error is thrown
    public subscript<ValueType>(unsafe key: KeyPath<Wrapped, ValueType>) -> ValueType {
        do {
            return try value(for: key)
        } catch {
            fatalError()
        }
    }

    /// Returns the optional value for the given `key`, but fails if an error is thrown
    public subscript<ValueType>(unsafe key: KeyPath<Wrapped, ValueType?>) -> ValueType {
        do {
            return try value(for: key)
        } catch {
            fatalError()
        }
    }

    /// Returns or updates the value at a given keypath
    ///
    /// If the value at the keypath is also an instance of `Partial` it is returned directly.
    /// Otherwise a new partial is created, either holding the value if found, or empty if not found.
    public subscript<ValueType>(key: KeyPath<Wrapped, ValueType>) -> Partial<ValueType> where ValueType: PartialConvertible {
        get {
            if let value = try? self.value(for: key) {
                return Partial<ValueType>(backingValue: value)
            } else if let partial = values[key] as? Partial<ValueType> {
                return partial
            } else {
                return Partial<ValueType>()
            }
        }
        set {
            values.updateValue(newValue, forKey: key)
        }
    }

    /// Returns or updates the optional value at a given keypath
    ///
    /// If the value at the keypath is also an instance of `Partial` it is returned directly.
    /// Otherwise a new partial is created, either holding the value if found, or empty if not found.
    public subscript<ValueType>(key: KeyPath<Wrapped, ValueType?>) -> Partial<ValueType> where ValueType: PartialConvertible {
        get {
            if let value = try? self.value(for: key) {
                return Partial<ValueType>(backingValue: value)
            } else if let partial = values[key] as? Partial<ValueType> {
                return partial
            } else {
                return Partial<ValueType>()
            }
        }
        set {
            values.updateValue(newValue, forKey: key)
        }
    }

    /// Returns the value for the given `key` and casts it into the type declared by it.
    ///
    /// - Throws:
    ///   - `Error.invalidValueType`, if the value is not of the expected type
    ///   - `Error.missingKey`, if the value is unknown
    public func value<ValueType>(for key: KeyPath<Wrapped, ValueType>) throws -> ValueType {
        if let value = values[key] {
            if let value = value as? ValueType {
                return value
            } else if let value = value {
                throw Error.invalidValueType(key: key, actualValue: value)
            }
        } else if let value = backingValue?[keyPath: key] {
            return value
        }

        throw Error.missingKey(key)
    }

    /// Returns the value for the given `key` and casts it into the type declared by it.
    ///
    /// - Throws:
    ///   - `Error.invalidValueType`, if the value is not of the expected type
    ///   - `Error.missingKey`, if the value is unknown
    public func value<ValueType>(for key: KeyPath<Wrapped, ValueType?>) throws -> ValueType {
        if let value = values[key] {
            if let value = value as? ValueType {
                return value
            } else if let value = value {
                throw Error.invalidValueType(key: key, actualValue: value)
            }
        } else if let value = backingValue?[keyPath: key] {
            return value
        }

        throw Error.missingKey(key)
    }

    /// Returns the value for the given `key` and creates another instance of `Partial` from it
    ///
    /// - Throws:
    ///   - `Error.invalidValueType`, if the value is not of the expected type
    ///   - `Error.missingKey`, if the value is unknown
    public func value<ValueType>(for key: KeyPath<Wrapped, ValueType>) throws -> ValueType where ValueType: PartialConvertible {
        if let value = values[key] {
            if let value = value as? ValueType {
                return value
            } else if let partial = value as? Partial<ValueType> {
                return try ValueType(partial: partial)
            } else if let value = value {
                throw Error.invalidValueType(key: key, actualValue: value)
            }
        } else if let value = backingValue?[keyPath: key] {
            return value
        }

        throw Error.missingKey(key)
    }

    /// Returns the value for the given `key` and creates another instance of `Partial` from it
    ///
    /// - Throws:
    ///   - `Error.invalidValueType`, if the value is not of the expected type
    ///   - `Error.missingKey`, if the value is unknown
    public func value<ValueType>(for key: KeyPath<Wrapped, ValueType?>) throws -> ValueType where ValueType: PartialConvertible {
        if let value = values[key] {
            if let value = value as? ValueType {
                return value
            } else if let partial = value as? Partial<ValueType> {
                return try ValueType(partial: partial)
            } else if let value = value {
                throw Error.invalidValueType(key: key, actualValue: value)
            }
        } else if let value = backingValue?[keyPath: key] {
            return value
        }

        throw Error.missingKey(key)
    }
}
