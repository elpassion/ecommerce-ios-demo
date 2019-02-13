import UIKit

class ProductPresentTransition: NSObject, UIViewControllerAnimatedTransitioning {

    enum Direction {
        case present
        case dismiss
    }

    var animate: (@escaping () -> Void) -> Void = { $0() }
    var direction = Direction.present
    weak var cardView: ProductCardView?
    weak var productView: ProductView?

    // MARK: UIViewControllerAnimatedTransitioning

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let cardView = cardView, let productView = productView else {
            transitionContext.completeTransition(false)
            return
        }
        if productView.superview == nil {
            transitionContext.containerView.addSubview(productView)
            productView.frame = transitionContext.containerView.bounds
        }

        let duration = transitionDuration(using: transitionContext)
        let transition: SnapshotTransition
        switch direction {
        case .present:
            transition = SnapshotTransition(
                from: cardView,
                to: productView,
                in: transitionContext.containerView,
                childTransitions: [
                    (from: cardView.topBackgroundView, to: productView.topBackgroundView),
                    (from: cardView.imageContainer, to: productView.imageContainer),
                    (from: cardView.nameLabel, to: productView.nameLabel),
                    (from: cardView.button, to: productView.addToCartButton)
                ]
            )
        case .dismiss:
            transition = SnapshotTransition(
                from: productView,
                to: cardView,
                in: transitionContext.containerView,
                childTransitions: [
                    (from: productView.topBackgroundView, to: cardView.topBackgroundView),
                    (from: productView.imageContainer, to: cardView.imageContainer),
                    (from: productView.nameLabel, to: cardView.nameLabel),
                    (from: productView.addToCartButton, to: cardView.button)
                ]
            )
        }
        transition.prepare()

        animate {
            UIView.animateKeyframes(
                withDuration: duration,
                delay: 0,
                options: [],
                animations: { transition.addKeyframes() },
                completion: { finished in
                    transition.cleanUp()
                    let completed = finished && !transitionContext.transitionWasCancelled
                    transitionContext.completeTransition(completed)
                }
            )
        }
    }

}
