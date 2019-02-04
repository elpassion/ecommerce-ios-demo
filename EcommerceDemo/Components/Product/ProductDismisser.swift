import UIKit

struct ProductDismisser: ProductDismissing {
    func dismiss(productViewController viewController: UIViewController) {
        viewController.presentingViewController?.dismiss(animated: true)
    }
}
