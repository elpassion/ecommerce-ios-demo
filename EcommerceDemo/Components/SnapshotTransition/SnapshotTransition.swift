import UIKit

class SnapshotTransition {

    init(from: UIView,
         to: UIView,
         in container: UIView,
         clipToBounds: Bool = true,
         childTransitions: [(from: UIView, to: UIView)] = []) {
        self.fromView = from
        self.toView = to
        self.containerView = container
        let transitionView = UIView(frame: .zero)
        transitionView.clipsToBounds = clipToBounds
        self.transitionView = transitionView
        self.childTransitions = childTransitions.map {
            SnapshotTransition(from: $0.from, to: $0.to, in: transitionView, clipToBounds: false)
        }
    }

    func prepare() {
        let layerCornerRadiuses = [fromView, toView].map { ($0.layer, $0.layer.cornerRadius) }
        layerCornerRadiuses.forEach { $0.0.cornerRadius = 0 }
        let layerShadows = [fromView, toView].map { $0.layer }.map { ($0, LayerShadow.from($0)) }
        layerShadows.forEach { $0.0.apply(LayerShadow.none) }
        let childAlphas = childTransitions.flatMap { [$0.fromView, $0.toView] }.map { ($0, $0.alpha) }
        childAlphas.forEach { $0.0.alpha = 0 }

        toSnapshot = toView.snapshotView(afterScreenUpdates: true)
        fromSnapshot = fromView.snapshotView(afterScreenUpdates: true)

        layerCornerRadiuses.forEach { $0.0.cornerRadius = $0.1 }
        layerShadows.forEach { $0.0.apply($0.1) }
        childAlphas.forEach { $0.0.alpha = $0.1 }

        [fromSnapshot, toSnapshot].compactMap { $0 }.forEach {
            transitionView.addSubview($0)
            $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            $0.frame = transitionView.bounds
        }

        fromSnapshot?.alpha = 1
        toSnapshot?.alpha = 0
        fromView.alpha = 0
        toView.alpha = 0

        transitionView.layer.cornerRadius = fromView.layer.cornerRadius
        transitionView.layer.apply(LayerShadow.from(fromView.layer))
        transitionView.frame = fromView.convert(fromView.bounds, to: containerView)
        containerView.addSubview(transitionView)

        childTransitions.forEach { $0.prepare() }
    }

    func addKeyframes() {
        UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) { [toSnapshot] in
            toSnapshot?.alpha = 1
        }
        UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) { [fromSnapshot] in
            fromSnapshot?.alpha = 0
        }
        UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1) { [transitionView, toView] in
            transitionView.layer.cornerRadius = toView.layer.cornerRadius
            transitionView.frame = toView.convert(toView.bounds, to: transitionView.superview)
            transitionView.layer.apply(LayerShadow.from(toView.layer))
        }

        childTransitions.forEach { $0.addKeyframes() }
    }

    func cleanUp() {
        toView.alpha = 1
        fromView.alpha = 1
        transitionView.removeFromSuperview()
        fromSnapshot?.removeFromSuperview()
        toSnapshot?.removeFromSuperview()
        fromSnapshot = nil
        toSnapshot = nil

        childTransitions.forEach { $0.cleanUp() }
    }

    // MARK: Private

    private let fromView: UIView
    private let toView: UIView
    private let containerView: UIView
    private let transitionView: UIView
    private let childTransitions: [SnapshotTransition]
    private var fromSnapshot: UIView?
    private var toSnapshot: UIView?

}
