// swiftlint:disable identifier_name

// MARK: - ForwardApplication

precedencegroup ForwardApplication {
    associativity: left
    higherThan: AssignmentPrecedence
}

infix operator |>: ForwardApplication

public func |> <A: AnyObject>(x: A, f: (A) -> Void) -> A {
    f(x)
    return x
}
