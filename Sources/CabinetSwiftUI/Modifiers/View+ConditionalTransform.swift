import SwiftUI

/// Generic extension to apply conditional transforms.
///
/// Source: https://www.avanderlee.com/swiftui/conditional-view-modifier/
///
///
extension View {

    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder public func `if`<Content: View>(_ condition: Bool, @ViewBuilder transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }

    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder public func `ifelse`<IfContent: View, ElseContent: View>(_ condition: Bool, @ViewBuilder ifTransform: (Self) -> IfContent, elseTransform: (Self) -> ElseContent) -> some View {
        if condition {
            ifTransform(self)
        } else {
            elseTransform(self)
        }
    }

    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder public func `if`<Content: View, Item>(item: Optional<Item>, @ViewBuilder transform: (Self, Item) -> Content) -> some View {
        if let item = item {
            transform(self, item)
        } else {
            self
        }
    }
}
