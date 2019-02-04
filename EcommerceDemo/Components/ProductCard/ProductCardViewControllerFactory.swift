import UIKit

struct ProductCardViewControllerFactory: ProductCardViewControllerCreating {
    var presenter: ProductPresenting = ProductPresenter()

    func create(with product: Product) -> ProductCardViewController {
        return ProductCardViewController(product: product, presenter: presenter)
    }
}
