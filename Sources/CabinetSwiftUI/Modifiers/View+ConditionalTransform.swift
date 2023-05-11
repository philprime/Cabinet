// swiftlint:disable large_tuple line_length

import SwiftUI

/// Generic extension to apply conditional transforms.
///
/// Source: https://www.avanderlee.com/swiftui/conditional-view-modifier/
///
///
@available(iOS 13.0, macOS 11, *)
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
    @ViewBuilder public func `if`<Content: View, Item>(item: Item?, @ViewBuilder transform: (Self, Item) -> Content) -> some View {
        if let item = item {
            transform(self, item)
        } else {
            self
        }
    }

    /// Applies the given transform if all of the given values are not nil
    ///
    /// - Parameters:
    ///   - items: A tuple of values
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if all values exist
    @ViewBuilder public func `if`<Content: View, Item1, Item2>(
        items: (Optional<Item1>, Optional<Item2>),
        @ViewBuilder transform: (Self, (Item1, Item2)) -> Content
    ) -> some View {
        if let item1 = items.0, let item2 = items.1 {
            transform(self, (item1, item2))
        } else {
            self
        }
    }

    /// Applies the given transform if all of the given values are not nil
    ///
    /// - Parameters:
    ///   - items: A tuple of values
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if all values exist
    @ViewBuilder public func `if`<Content: View, Item1, Item2, Item3>(
        items: (Optional<Item1>, Optional<Item2>, Optional<Item3>),
        @ViewBuilder transform: (Self, (Item1, Item2, Item3)) -> Content
    ) -> some View {
        if let item1 = items.0, let item2 = items.1, let item3 = items.2 {
            transform(self, (item1, item2, item3))
        } else {
            self
        }
    }

    /// Applies the given transform if all of the given values are not nil
    ///
    /// - Parameters:
    ///   - items: A tuple of values
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if all values exist
    @ViewBuilder public func `if`<Content: View, Item1, Item2, Item3, Item4>(
        items: (Optional<Item1>, Optional<Item2>, Optional<Item3>, Optional<Item4>),
        @ViewBuilder transform: (Self, (Item1, Item2, Item3, Item4)) -> Content
    ) -> some View {
        if let item1 = items.0, let item2 = items.1, let item3 = items.2, let item4 = items.3 {
            transform(self, (item1, item2, item3, item4))
        } else {
            self
        }
    }

    /// Applies the given transform if all of the given values are not nil
    ///
    /// - Parameters:
    ///   - items: A tuple of values
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if all values exist
    @ViewBuilder public func `if`<Content: View, Item1, Item2, Item3, Item4, Item5>(
        items: (Optional<Item1>, Optional<Item2>, Optional<Item3>, Optional<Item4>, Optional<Item5>),
        @ViewBuilder transform: (Self, (Item1, Item2, Item3, Item4, Item5)) -> Content
    ) -> some View {
        if let item1 = items.0, let item2 = items.1, let item3 = items.2, let item4 = items.3, let item5 = items.4 {
            transform(self, (item1, item2, item3, item4, item5))
        } else {
            self
        }
    }

    /// Applies the given transform if all of the given values are not nil
    ///
    /// - Parameters:
    ///   - items: A tuple of values
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if all values exist
    @ViewBuilder public func `if`<Content: View, Item1, Item2, Item3, Item4, Item5, Item6>(
        items: (Optional<Item1>, Optional<Item2>, Optional<Item3>, Optional<Item4>, Optional<Item5>, Optional<Item6>),
        @ViewBuilder transform: (Self, (Item1, Item2, Item3, Item4, Item5, Item6)) -> Content
    ) -> some View {
        if let item1 = items.0, let item2 = items.1, let item3 = items.2, let item4 = items.3, let item5 = items.4, let item6 = items.5 {
            transform(self, (item1, item2, item3, item4, item5, item6))
        } else {
            self
        }
    }

    /// Applies the given transform if all of the given values are not nil
    ///
    /// - Parameters:
    ///   - items: A tuple of values
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if all values exist
    @ViewBuilder public func `if`<Content: View, Item1, Item2, Item3, Item4, Item5, Item6, Item7>(
        items: (Optional<Item1>, Optional<Item2>, Optional<Item3>, Optional<Item4>, Optional<Item5>, Optional<Item6>, Optional<Item7>),
        @ViewBuilder transform: (Self, (Item1, Item2, Item3, Item4, Item5, Item6, Item7)) -> Content
    ) -> some View {
        if let item1 = items.0, let item2 = items.1, let item3 = items.2, let item4 = items.3, let item5 = items.4, let item6 = items.5, let item7 = items.6 {
            transform(self, (item1, item2, item3, item4, item5, item6, item7))
        } else {
            self
        }
    }

    /// Applies the given transform if all of the given values are not nil
    ///
    /// - Parameters:
    ///   - items: A tuple of values
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if all values exist
    @ViewBuilder public func `if`<Content: View, Item1, Item2, Item3, Item4, Item5, Item6, Item7, Item8>(
        items: (Optional<Item1>, Optional<Item2>, Optional<Item3>, Optional<Item4>, Optional<Item5>, Optional<Item6>, Optional<Item7>, Optional<Item8>),
        @ViewBuilder transform: (Self, (Item1, Item2, Item3, Item4, Item5, Item6, Item7, Item8)) -> Content
    ) -> some View {
        if let item1 = items.0, let item2 = items.1, let item3 = items.2, let item4 = items.3, let item5 = items.4, let item6 = items.5, let item7 = items.6, let item8 = items.7 {
            transform(self, (item1, item2, item3, item4, item5, item6, item7, item8))
        } else {
            self
        }
    }

    /// Applies the given transform if all of the given values are not nil
    ///
    /// - Parameters:
    ///   - items: A tuple of values
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if all values exist
    @ViewBuilder public func `if`<Content: View, Item1, Item2, Item3, Item4, Item5, Item6, Item7, Item8, Item9>(
        items: (Optional<Item1>, Optional<Item2>, Optional<Item3>, Optional<Item4>, Optional<Item5>, Optional<Item6>, Optional<Item7>, Optional<Item8>, Optional<Item9>),
        @ViewBuilder transform: (Self, (Item1, Item2, Item3, Item4, Item5, Item6, Item7, Item8, Item9)) -> Content
    ) -> some View {
        if let item1 = items.0, let item2 = items.1, let item3 = items.2, let item4 = items.3, let item5 = items.4, let item6 = items.5, let item7 = items.6, let item8 = items.7, let item9 = items.8 {
            transform(self, (item1, item2, item3, item4, item5, item6, item7, item8, item9))
        } else {
            self
        }
    }

    /// Applies the given transform if all of the given values are not nil
    ///
    /// - Parameters:
    ///   - items: A tuple of values
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if all values exist
    @ViewBuilder public func `if`<Content: View, Item1, Item2, Item3, Item4, Item5, Item6, Item7, Item8, Item9, Item10>(
        items: (Optional<Item1>, Optional<Item2>, Optional<Item3>, Optional<Item4>, Optional<Item5>, Optional<Item6>, Optional<Item7>, Optional<Item8>, Optional<Item9>, Optional<Item10>),
        @ViewBuilder transform: (Self, (Item1, Item2, Item3, Item4, Item5, Item6, Item7, Item8, Item9, Item10)) -> Content
    ) -> some View {
        if let item1 = items.0, let item2 = items.1, let item3 = items.2, let item4 = items.3, let item5 = items.4, let item6 = items.5, let item7 = items.6, let item8 = items.7, let item9 = items.8, let item10 = items.9 {
            transform(self, (item1, item2, item3, item4, item5, item6, item7, item8, item9, item10))
        } else {
            self
        }
    }
}

// swiftlint:enable large_tuple line_length
