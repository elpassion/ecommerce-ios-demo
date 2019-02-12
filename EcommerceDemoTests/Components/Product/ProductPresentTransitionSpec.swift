import Quick
import Nimble
import SnapshotTesting
@testable import EcommerceDemo

class ProductPresentTransitionSpec: QuickSpec {
    override func spec() {
        describe("ProductPresentTransition") {
            var sut: ProductPresentTransition!

            beforeEach {
                sut = ProductPresentTransition()
            }

            it("should return correct transition duration") {
                expect(sut.transitionDuration(using: nil)) == 0.25
            }

            context("animate") {
                var didAnimate: Bool!

                beforeEach {
                    sut.animate { didAnimate = true }
                }

                it("should animate") {
                    expect(didAnimate) == true
                }
            }

            context("animate transition without views") {
                var transitionContext: ContextDouble!

                beforeEach {
                    transitionContext = ContextDouble()
                    sut.cardView = nil
                    sut.productView = nil
                    sut.animateTransition(using: transitionContext)
                }

                it("should complete context with false") {
                    expect(transitionContext.didComplete) == false
                }
            }

            describe("scene") {
                var scene: UIView!
                var dealsViewController: UIViewController!
                var cardViewController: UIViewController!

                beforeEach {
                    scene = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
                    scene.layoutPinWidth(to: scene.frame.width)
                    scene.layoutPinHeight(to: scene.frame.height)
                    dealsViewController = DealsViewControllerFactory().create(with: [.surface])
                    scene.addSubview(dealsViewController.view)
                    dealsViewController.view.frame = scene.bounds
                    scene.setNeedsLayout()
                    scene.layoutIfNeeded()
                    cardViewController = dealsViewController.children.first!
                }

                context("animate present transition") {
                    var productViewController: UIViewController!
                    var transitionContext: ContextDouble!
                    var animator: UIViewPropertyAnimator!

                    beforeEach {
                        productViewController = ProductViewControllerFactory().create(with: .surface)
                        transitionContext = ContextDouble()
                        scene.addSubview(transitionContext.containerView)
                        transitionContext.containerView.frame = scene.bounds

                        animator = UIViewPropertyAnimator(duration: 1, curve: .linear)
                        animator.pauseAnimation()

                        sut.direction = .present
                        sut.cardView = cardViewController.view as? ProductCardView
                        sut.productView = productViewController.view as? ProductView
                        sut.animate = { animator.addAnimations($0) }
                        sut.animateTransition(using: transitionContext)
                    }

                    afterEach {
                        animator.pauseAnimation()
                        animator.stopAnimation(false)
                        animator.finishAnimation(at: .current)
                    }

                    it("should add product view to container view") {
                        expect(productViewController.view.superview) === transitionContext.containerView
                    }

                    it("should animation have correct snapshots") {
                        [CGFloat]([0, 0.25, 0.5, 0.75, 1]).forEach({ percentage in
                            animator.fractionComplete = percentage
                            assertSnapshot(
                                matching: UIView.view(with: scene).snapshotImage(),
                                as: .image,
                                named: "present_\(String(format: "%03.0f", percentage * 100))"
                            )
                        })
                    }

                    context("when animation completes without finishing") {
                        beforeEach {
                            animator.pauseAnimation()
                            animator.fractionComplete = 0.5
                            animator.stopAnimation(true)
                            animator.finishAnimation(at: .current)
                        }

                        it("should complete context with false") {
                            expect(transitionContext.didComplete) == false
                        }
                    }

                    context("when animation completes") {
                        beforeEach {
                            animator.pauseAnimation()
                            animator.fractionComplete = 1
                            animator.stopAnimation(false)
                            animator.finishAnimation(at: .end)
                        }

                        it("should complete context with true") {
                            expect(transitionContext.didComplete) == true
                        }

                        context("animate dismiss transition") {
                            var animator: UIViewPropertyAnimator!

                            beforeEach {
                                animator = UIViewPropertyAnimator(duration: 1, curve: .linear)
                                animator.pauseAnimation()

                                sut.direction = .dismiss
                                sut.animate = { animator.addAnimations($0) }
                                sut.animateTransition(using: transitionContext)
                            }

                            afterEach {
                                animator.pauseAnimation()
                                animator.stopAnimation(false)
                                animator.finishAnimation(at: .current)
                            }

                            it("should animation have correct snapshots") {
                                [CGFloat]([0, 0.25, 0.5, 0.75, 1]).forEach({ percentage in
                                    animator.fractionComplete = percentage
                                    assertSnapshot(
                                        matching: UIView.view(with: scene).snapshotImage(),
                                        as: .image,
                                        named: "dismiss_\(String(format: "%03.0f", percentage * 100))"
                                    )
                                })
                            }
                        }
                    }
                }
            }
        }
    }

    private class ContextDouble: NSObject, UIViewControllerContextTransitioning {

        var didComplete: Bool?

        // MARK: UIViewControllerContextTransitioning

        var containerView: UIView = UIView(frame: .zero)
        var isAnimated: Bool = false
        var isInteractive: Bool = false
        var transitionWasCancelled: Bool = false
        var presentationStyle: UIModalPresentationStyle = .overFullScreen
        var targetTransform: CGAffineTransform = .identity

        func updateInteractiveTransition(_ percentComplete: CGFloat) {}
        func finishInteractiveTransition() {}
        func cancelInteractiveTransition() {}
        func pauseInteractiveTransition() {}
        func completeTransition(_ didComplete: Bool) { self.didComplete = didComplete }
        func viewController(forKey key: UITransitionContextViewControllerKey) -> UIViewController? { return nil }
        func view(forKey key: UITransitionContextViewKey) -> UIView? { return nil }
        func initialFrame(for vc: UIViewController) -> CGRect { return .zero }
        func finalFrame(for vc: UIViewController) -> CGRect { return .zero }

    }

}
