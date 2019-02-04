import UIKit

struct ProductCardViewControllerFactory: ProductCardViewControllerCreating {
    func create(with product: Product) -> ProductCardViewController {
        return ProductCardViewController(product: product)
    }
}
