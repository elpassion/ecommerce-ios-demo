import UIKit
@testable import EcommerceDemo

struct DealsViewControllerCreatingDouble: DealsViewControllerCreating {
    var viewController = UIViewController()

    func create() -> UIViewController {
        return viewController
    }
}
