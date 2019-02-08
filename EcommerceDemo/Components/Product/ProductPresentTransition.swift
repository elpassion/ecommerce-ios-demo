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
            productView.frame = transitionContext.containerView.bounds
        }

        // TODO: Spike

        var animations: [() -> Void] = []
        var completions: [() -> Void] = []

        switch direction {
        case .present:
            if let cardSnapshot = cardView.snapshotView(afterScreenUpdates: true) {
                transitionContext.containerView.addSubview(cardSnapshot)
                cardSnapshot.frame = cardView.convert(cardView.bounds, to: cardSnapshot.superview)
                cardSnapshot.alpha = 1
                animations.append {
                    cardSnapshot.alpha = 0
                    cardSnapshot.frame = productView.convert(productView.bounds, to: cardSnapshot.superview)
                }
                completions.append {
                    cardSnapshot.removeFromSuperview()
                }
            }
            if let productSnapshot = productView.snapshotView(afterScreenUpdates: true) {
                transitionContext.containerView.addSubview(productSnapshot)
                productSnapshot.frame = cardView.convert(cardView.bounds, to: productSnapshot.superview)
                productSnapshot.alpha = 0
                animations.append {
                    productSnapshot.alpha = 1
                    productSnapshot.frame = productView.convert(productView.bounds, to: productSnapshot.superview)
                }
                completions.append {
                    productSnapshot.removeFromSuperview()
                }
            }
            productView.alpha = 0
            cardView.alpha = 0
            completions.append {
                productView.alpha = 1
                cardView.alpha = 1
            }
        case .dismiss:
            if let cardSnapshot = cardView.snapshotView(afterScreenUpdates: true) {
                transitionContext.containerView.addSubview(cardSnapshot)
                cardSnapshot.frame = productView.convert(productView.bounds, to: cardSnapshot.superview)
                cardSnapshot.alpha = 0
                animations.append {
                    cardSnapshot.alpha = 1
                    cardSnapshot.frame = cardView.convert(cardView.bounds, to: cardSnapshot.superview)
                }
                completions.append {
                    cardSnapshot.removeFromSuperview()
                }
            }
            if let productSnapshot = productView.snapshotView(afterScreenUpdates: true) {
                transitionContext.containerView.addSubview(productSnapshot)
                productSnapshot.frame = productView.convert(productView.bounds, to: productSnapshot.superview)
                productSnapshot.alpha = 1
                animations.append {
                    productSnapshot.alpha = 0
                    productSnapshot.frame = cardView.convert(cardView.bounds, to: productSnapshot.superview)
                }
                completions.append {
                    productSnapshot.removeFromSuperview()
                }
            }
            productView.alpha = 0
            cardView.alpha = 0
            completions.append {
                productView.alpha = 1
                cardView.alpha = 1
            }
        }

        let duration = transitionDuration(using: transitionContext)
        let allAnimations = { animations.forEach { $0() } }
        let completion: (Bool) -> Void = { finished in
            completions.forEach { $0() }
            let completed = finished && !transitionContext.transitionWasCancelled
            transitionContext.completeTransition(completed)
        }
        animator(duration, allAnimations, completion)
    }

}
