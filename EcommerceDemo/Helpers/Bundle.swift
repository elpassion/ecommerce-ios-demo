import Foundation

extension Bundle {}

public var bundle: Bundle {
    class BundleClass {}
    return Bundle(for: BundleClass.self)
}
