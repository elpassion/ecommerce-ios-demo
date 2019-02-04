import UIKit
@testable import EcommerceDemo

class DealsViewControllerCreatingDouble: DealsViewControllerCreating {

    private(set) var didCreateWithProducts: [Product]?
    var createdViewController = UIViewController()

    // MARK: DealsViewControllerCreating

    func create(with products: [Product]) -> UIViewController {
        didCreateWithProducts = products
        return createdViewController
    }

}
