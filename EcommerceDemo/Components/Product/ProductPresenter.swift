import UIKit

struct ProductPresenter: ProductPresenting {

    var factory: ProductViewControllerCreating = ProductViewControllerFactory()

    func present(_ product: Product, from presenting: UIViewController) {
        let viewController = factory.create(with: product)
        presenting.present(viewController, animated: true)
    }

}
