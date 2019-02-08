import UIKit

class ProductPresentTransition: NSObject, UIViewControllerAnimatedTransitioning {

    typealias Animator = (TimeInterval, @escaping () -> Void, ((Bool) -> Void)?) -> Void

    enum Direction {
        case present
        case dismiss
    }

    var animator: Animator = UIView.animate(withDuration:animations:completion:)
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
            productView.clipsToBounds = true
        }

        // TODO: animate transition
        productView.frame = transitionContext.containerView.bounds

        let duration = transitionDuration(using: transitionContext)
        let animations = {}
        let completion = { transitionContext.completeTransition(!(!$0 || transitionContext.transitionWasCancelled)) }
        animator(duration, animations, completion)
    }

}
