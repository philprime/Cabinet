//
//  MultiAssignmentOperator.swift
//  Cabinet
//
//  Created by Philip Niedertscheider on 21.02.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//

/// Operator for assigning and returning a value
infix operator <--: MultiAssignmentOperatorPrecedenceGroup
/// Operator for assigning and returning a value, if it is `nil`
infix operator <-?-: MultiAssignmentOperatorPrecedenceGroup

/// Assigns parameter `value` into`target` and returns `value` afterwards to be used again
/// - Parameters:
///   - target: Pointer to where to store the given value
///   - value: Value to be set
/// - Returns: Value for direct usage
public func <-- <T>(target: inout T, value: T) -> T {
    target = value
    return value
}

/// Assigns parameter `value` into`target` if target is `nil` and returns `value` in any case
/// - Parameters:
///   - target: Pointer to where to store the given value
///   - value: Value to be set
/// - Returns: Value for direct usage
public func <-?- <T>(target: inout T?, value: T) -> T {
    if target == nil {
        target = value
    }
    return value
}

precedencegroup MultiAssignmentOperatorPrecedenceGroup {

    // We start with evaluating the value and assigning afterwards into the left variable
    associativity: right

    // An input value should be casted first, before actually assigning to another variable
    lowerThan: CastingPrecedence

}
