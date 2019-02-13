import UIKit

class SnapshotTransition {

    init(from: UIView, to: UIView, in container: UIView, clipToBounds: Bool = true) {
        self.fromView = from
        self.toView = to
        self.containerView = container
        transitionView.clipsToBounds = clipToBounds
    }

    func prepare() {
        let layerCornerRadiuses = [fromView, toView].map { ($0.layer, $0.layer.cornerRadius) }
        layerCornerRadiuses.forEach { $0.0.cornerRadius = 0 }
        let layerShadows = [fromView, toView].map { $0.layer }.map { ($0, LayerShadow.from($0)) }
        layerShadows.forEach { $0.0.apply(LayerShadow.none) }
        [fromView, toView].forEach { $0.alpha = 1 }

        toSnapshot = toView.snapshotView(afterScreenUpdates: true)
        fromSnapshot = fromView.snapshotView(afterScreenUpdates: true)

        layerCornerRadiuses.forEach { $0.0.cornerRadius = $0.1 }
        layerShadows.forEach { $0.0.apply($0.1) }

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
    }

    func cleanUp() {
        toView.alpha = 1
        fromView.alpha = 1
        transitionView.removeFromSuperview()
        fromSnapshot?.removeFromSuperview()
        toSnapshot?.removeFromSuperview()
        fromSnapshot = nil
        toSnapshot = nil
    }

    // MARK: Private

    private let fromView: UIView
    private let toView: UIView
    private let containerView: UIView
    private let transitionView = UIView(frame: .zero)
    private var fromSnapshot: UIView?
    private var toSnapshot: UIView?

}
