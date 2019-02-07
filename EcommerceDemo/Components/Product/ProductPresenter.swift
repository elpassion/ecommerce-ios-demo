import UIKit

class ProductPresenter: NSObject, ProductPresenting, UIViewControllerTransitioningDelegate {

    init(factory: ProductViewControllerCreating = ProductViewControllerFactory()) {
        self.factory = factory
    }

    // MARK: ProductPresenting

    func present(_ product: Product, from presenting: UIViewController) {
        let viewController = factory.create(with: product)
        viewController.modalPresentationStyle = .overFullScreen
        viewController.transitioningDelegate = self
        presenting.present(viewController, animated: true)
    }

    // MARK: UIViewControllerTransitioningDelegate

    func animationController(
        forPresented presented: UIViewController,
        presenting: UIViewController,
        source: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        transition.direction = .present
        transition.cardView = (source as? ProductCardViewController)?.view as? ProductCardView
        transition.productView = (presented as? ProductViewController)?.view as? ProductView
        return transition
    }

    func animationController(
        forDismissed dismissed: UIViewController
    ) -> UIViewControllerAnimatedTransitioning? {
        transition.direction = .dismiss
        return transition
    }

    // MARK: Private

    private let factory: ProductViewControllerCreating
    private let transition = ProductPresentTransition()

}
