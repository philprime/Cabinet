//
//  MultiAssignmentOperator.swift
//  Cabinet
//
//  Created by Philip Niedertscheider on 21.02.20.
//  Copyright © 2020 Philip Niedertscheider. All rights reserved.
//

infix operator <--
infix operator <-?-

// swiftlint:disable static_operator
/**
 * Assigns parameter `value` into`target` and returns `value` afterwards to be used again
 */
public func <-- <T>(target: inout T?, value: T) -> T {
    target = value
    return value
}

/**
 * Assigns parameter `value` into`target` if target is `nil` and returns `value` in any case
 */
public func <-?- <T>(target: inout T?, value: T) -> T {
    if target == nil {
        target = value
    }
    return value
}
