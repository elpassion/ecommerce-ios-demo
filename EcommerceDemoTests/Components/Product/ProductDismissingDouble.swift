@testable import EcommerceDemo

class ProductDismissingDouble: ProductDismissing {
    private(set) var didDismissViewController: UIViewController?

    func dismiss(productViewController viewController: UIViewController) {
        didDismissViewController = viewController
    }
}
