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
            if let snapshot = productView.snapshotView(afterScreenUpdates: true) {
                transitionContext.containerView.addSubview(snapshot)
                snapshot.frame = cardView.convert(cardView.bounds, to: snapshot.superview)
                animations.append {
                    snapshot.frame = productView.convert(productView.bounds, to: snapshot.superview)
                }
                completions.append {
                    snapshot.removeFromSuperview()
                }
            }
            productView.isHidden = true
            completions.append { productView.isHidden = false }
        case .dismiss:
            if let snapshot = productView.snapshotView(afterScreenUpdates: true) {
                transitionContext.containerView.addSubview(snapshot)
                snapshot.frame = productView.convert(productView.bounds, to: snapshot.superview)
                animations.append {
                    snapshot.frame = cardView.convert(cardView.bounds, to: snapshot.superview)
                }
                completions.append {
                    snapshot.removeFromSuperview()
                }
            }
            productView.isHidden = true
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
