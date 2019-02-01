import Nimble

struct NotNilExpectation<A> {
    fileprivate let subject: A?

    func then(_ closure: (A) -> Void) {
        guard let subject = subject else { return }
        closure(subject)
    }
}

func expectNotNil<A>(_ subject: A?, file: FileString = #file, line: UInt = #line) -> NotNilExpectation<A> {
    if subject == nil {
        fail("expected <\(A.self)>, got nil", file: file, line: line)
    }
    return NotNilExpectation(subject: subject)
}
