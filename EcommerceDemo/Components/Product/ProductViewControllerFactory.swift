import UIKit

struct ProductViewControllerFactory: ProductViewControllerCreating {
    var dismisser: ProductDismissing = ProductDismisser()

    func create(with product: Product) -> UIViewController {
        return ProductViewController(
            product: product,
            specsViewController: ProductSpecsViewController(specs: product.specs),
            descriptionsViewController: ProductDescriptionsViewController(descriptions: product.descriptions),
            dismisser: dismisser
        )
    }
}
