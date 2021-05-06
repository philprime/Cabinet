/// Protocol used for identifying generic optional objects
public protocol AnyOptional {

    /// Returns a boolean flag, if the object implementing this protocol represents `nil`
    var isNil: Bool { get }

    /// Returns the object, in case it is not nil
    var wrapped: Any { get }

}

extension Optional: AnyOptional {

    /// Returns `true` if the optional is empy
    public var isNil: Bool {
        self == nil
    }

    /// Unsafely unwrap the content of this optional
    ///
    /// Make sure to check `ifNil` before accessing this property, otherwise the unsafe unwrap might fail
    public var wrapped: Any {
        self.unsafelyUnwrapped
    }
}
