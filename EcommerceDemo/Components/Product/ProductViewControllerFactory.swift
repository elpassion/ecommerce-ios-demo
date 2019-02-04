import UIKit

struct ProductViewControllerFactory: ProductViewControllerCreating {
    var dismisser: ProductDismissing = ProductDismisser()

    func create(with product: Product) -> UIViewController {
        return ProductViewController(product: product, dismisser: dismisser)
    }
}
