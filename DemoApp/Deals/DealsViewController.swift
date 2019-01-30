import UIKit

class DealsViewController: UIViewController, UIScrollViewDelegate {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func loadView() {
        view = DealsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dealsView.titleLabel.text = "Today’s deals"
        dealsView.productViews = [
            ProductCardView(),
            ProductCardView(),
            ProductCardView(),
            ProductCardView(),
            ProductCardView()
        ]
        dealsView.scrollView.delegate = self
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    private var dealsView: DealsView! {
        return view as? DealsView
    }

    // MARK: UIScrollViewDelegate

    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        let pagePoints = dealsView.productViews.map { $0.frame.minX }
        let controller = ScrollPageController(pagePoints: pagePoints)
        let targetPoint = controller.targetContentOffsetX(current: scrollView.contentOffset.x, velocity: velocity.x)
        targetContentOffset.pointee.x = targetPoint - scrollView.adjustedContentInset.left
    }

}
