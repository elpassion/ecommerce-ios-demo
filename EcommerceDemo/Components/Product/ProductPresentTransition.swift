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
        guard cardView != nil, let productView = productView else {
            transitionContext.completeTransition(false)
            return
        }
        if productView.superview == nil {
            transitionContext.containerView.addSubview(productView)
            productView.frame = transitionContext.containerView.bounds
        }

        productView.alpha = direction == .present ? 0 : 1

        let duration = transitionDuration(using: transitionContext)

        animate { [weak self] in
            UIView.animateKeyframes(
                withDuration: duration,
                delay: 0,
                options: [],
                animations: {
                    UIView.addKeyframe(
                        withRelativeStartTime: 0,
                        relativeDuration: 1,
                        animations: {
                            productView.alpha = self?.direction == .present ? 1 : 0
                        }
                    )
                },
                completion: { finished in
                    let completed = finished && !transitionContext.transitionWasCancelled
                    transitionContext.completeTransition(completed)
                }
            )
        }
    }

}
