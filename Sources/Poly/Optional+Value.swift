internal extension Swift.Optional {
    func get(or getElseValue: @autoclosure () -> Wrapped) -> Wrapped {
        switch self {
        case let value?:
            return value
        case .none:
            return getElseValue()
        }
    }

}
