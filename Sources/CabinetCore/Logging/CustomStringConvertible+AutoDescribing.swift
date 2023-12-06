public extension CustomStringConvertible {
    /// Default implementation creating a description using reflection
    var autoDescription: String {
        createReflectionString(of: self)
    }
}

private func createReflectionString(of object: Any) -> String {
    let typeString = String(describing: type(of: object))
    let address = Unmanaged.passUnretained(object as AnyObject).toOpaque().debugDescription
    let children = Mirror(reflecting: object).children
        .compactMap { child -> (label: String, value: Any)? in
            guard let propertyName = child.label else { return nil }
            return (label: propertyName, value: child.value)
        }
        .map { "\($0.label): \($0.value)" }
        .joined(separator: ", ")

    return String(format: "%@<%@>(%@)", typeString, address, children)
}
