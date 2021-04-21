import SwiftUI
import Combine

/// Combine two boolean bindings with a logic **AND** operator into a single *readonly* boolean binding
///
/// - Parameters:
///   - lhs: first boolean binding
///   - rhs: second boolean binding
/// - Returns: boolean binding with readonly access
@available(iOS 13.0, OSX 10.15, *)
public func && (lhs: Binding<Bool>, rhs: Binding<Bool>) -> Binding<Bool> {
    Binding<Bool>(
        get: { lhs.wrappedValue && rhs.wrappedValue },
        set: { _ in fatalError() }
    )
}

/// Combine two boolean bindings with a logic **OR** operator into a single *readonly* boolean binding
///
/// - Parameters:
///   - lhs: first boolean binding
///   - rhs: second boolean binding
/// - Returns: boolean binding with readonly access
@available(iOS 13.0, OSX 10.15, *)
public func || (lhs: Binding<Bool>, rhs: Binding<Bool>) -> Binding<Bool> {
    Binding<Bool>(
        get: { lhs.wrappedValue || rhs.wrappedValue },
        set: { _ in }
    )
}
