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
        let presented = ProductPresentTransitionProperties.presented(
            productView: productView,
            container: transitionContext.containerView
        )
        let dismissed = ProductPresentTransitionProperties.dismissed(
            productView: productView,
            cardView: cardView,
            container: transitionContext.containerView
        )
        let properties: (start: ProductPresentTransitionProperties, end: ProductPresentTransitionProperties) = {
            switch direction {
            case .present:
                return (dismissed, presented)
            case .dismiss:
                return (presented, dismissed)
            }
        }()
        properties.start.apply(to: productView)
        let duration = transitionDuration(using: transitionContext)
        let animations = { properties.end.apply(to: productView) }
        let completion = { transitionContext.completeTransition(!(!$0 || transitionContext.transitionWasCancelled)) }
        animator(duration, animations, completion)
    }

}
