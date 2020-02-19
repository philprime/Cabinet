//
//  Partial.swift
//  Cabinet
//
//  Created by Philip Niedertscheider on 10.02.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//

public struct Partial<Wrapped> {
    
    public enum Error<ValueType>: Swift.Error {
        
        case missingKey(KeyPath<Wrapped, ValueType>)
        case invalidValueType(key: KeyPath<Wrapped, ValueType>, actualValue: Any)
        
    }
    
    private var values: [PartialKeyPath<Wrapped>: Any?] = [:]
    private var backingValue: Wrapped? = nil
    
    public init(backingValue: Wrapped? = nil) {
        self.backingValue = backingValue
    }
    
    public subscript<ValueType>(key: KeyPath<Wrapped, ValueType>) -> ValueType? {
        get {
            return try? value(for: key)
        }
        set {
            values.updateValue(newValue, forKey: key)
        }
    }
    
    public subscript<ValueType>(key: KeyPath<Wrapped, ValueType?>) -> ValueType? {
        get {
            return try? value(for: key)
        }
        set {
            values.updateValue(newValue, forKey: key)
        }
    }
    
    public subscript<ValueType>(unsafe key: KeyPath<Wrapped, ValueType>) -> ValueType {
        try! value(for: key)
    }
    
    public subscript<ValueType>(unsafe key: KeyPath<Wrapped, ValueType?>) -> ValueType {
        try! value(for: key)
    }
    
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
