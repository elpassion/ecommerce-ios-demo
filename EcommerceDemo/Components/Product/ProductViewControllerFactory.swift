import UIKit

struct ProductViewControllerFactory: ProductViewControllerCreating {
    func create(with product: Product) -> UIViewController {
        return ProductViewController(product: product)
    }
}
