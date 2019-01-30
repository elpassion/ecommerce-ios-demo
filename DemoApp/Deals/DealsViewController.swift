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

        let productCardView1 = ProductCardView()
        productCardView1.topBackgroundView.backgroundColor = .blackProduct

        let productCardView2 = ProductCardView()
        productCardView2.topBackgroundView.backgroundColor = .blueProduct

        let productCardView3 = ProductCardView()
        productCardView3.topBackgroundView.backgroundColor = .greenProduct

        dealsView.productViews = [
            productCardView1,
            productCardView2,
            productCardView3
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
