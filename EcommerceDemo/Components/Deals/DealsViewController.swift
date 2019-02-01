import UIKit

class DealsViewController: UIViewController, UIScrollViewDelegate {

    init(products: [Product]) {
        self.products = products
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: View

    override func loadView() {
        view = DealsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dealsView.titleLabel.text = "Today’s deals"
        dealsView.scrollView.delegate = self
        productCardViewControllers = products.map { ProductCardViewController(product: $0) }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        adjustScrollContent()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    private var dealsView: DealsView! {
        return view as? DealsView
    }

    private func adjustScrollContent() {
        guard dealsView.scrollView.contentSize != .zero else { return }
        let viewportCenterX = dealsView.scrollView.viewport.midX
        productCardViewControllers.forEach {
            $0.distanceFromCenter = $0.view.frame.midX - viewportCenterX
        }
    }

    // MARK: UIScrollViewDelegate

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        adjustScrollContent()
    }

    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>
    ) {
        let offset = scrollView.contentOffset.x
        let pageOffsets = dealsView.productViews.map { $0.frame.minX }
        if let pageOffset = scrollPageController.pageOffset(for: offset, velocity: velocity.x, in: pageOffsets) {
            targetContentOffset.pointee.x = pageOffset - scrollView.adjustedContentInset.left
        }
    }

    // MARK: Private

    private let products: [Product]
    private let scrollPageController = ScrollPageController()

    private var productCardViewControllers = [ProductCardViewController]() {
        didSet {
            productCardViewControllers.forEach { addChild($0) }
            dealsView.productViews = productCardViewControllers.map { $0.view }
            productCardViewControllers.forEach { $0.didMove(toParent: self) }
            oldValue.forEach { $0.removeFromParent() }
        }
    }

}
