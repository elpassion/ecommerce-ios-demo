// swiftlint:disable identifier_name

// MARK: - ForwardApplication

precedencegroup ForwardApplication {
    associativity: left
    higherThan: AssignmentPrecedence
}

infix operator |>: ForwardApplication

public func |> <A, B>(x: A, f: (A) -> B) -> B {
    return f(x)
}

public func |> <A>(x: inout A, f: (inout A) -> Void) -> A {
    f(&x)
    return x
}

public func |> <A: AnyObject>(x: A, f: (A) -> Void) -> A {
    f(x)
    return x
}

// MARK: - ForwardComposition

precedencegroup ForwardComposition {
    associativity: left
    higherThan: SingleTypeComposition
}

infix operator >>>: ForwardComposition

public func >>> <A, B, C>(f: @escaping (A) -> B, g: @escaping (B) -> C) -> (A) -> C {
    return { g(f($0)) }
}

// MARK: - SingleTypeComposition

precedencegroup SingleTypeComposition {
    associativity: right
    higherThan: ForwardApplication
}

infix operator <>: SingleTypeComposition

public func <> <A>(f: @escaping (A) -> A, g: @escaping (A) -> A) -> (A) -> A {
    return f >>> g
}

public func <> <A>(f: @escaping (inout A) -> Void, g: @escaping (inout A) -> Void) -> (inout A) -> Void {
    return { a in
        f(&a)
        g(&a)
    }
}

public func <> <A: AnyObject>(f: @escaping (A) -> Void, g: @escaping (A) -> Void) -> (A) -> Void {
    return { a in
        f(a)
        g(a)
    }
}
