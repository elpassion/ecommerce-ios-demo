import UIKit

class ProductViewController: UIViewController, UIToolbarDelegate {

    init(product: Product, specsViewController: UIViewController, dismisser: ProductDismissing) {
        self.product = product
        self.specsViewController = specsViewController
        self.dismisser = dismisser
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: View

    override func loadView() {
        view = ProductView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        productView.toolbar.barTintColor = product.color
        productView.imageContainer.image = product.image
        productView.toolbar.delegate = self
        productView.closeButton.target = self
        productView.closeButton.action = #selector(closeButtonAction)
        embedSpecsViewController()
    }

    private var productView: ProductView! {
        return view as? ProductView
    }

    @objc
    private func closeButtonAction() {
        dismisser.dismiss(productViewController: self)
    }

    // MARK: UIToolbarDelegate

    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }

    // MARK: Private

    private let product: Product
    private let dismisser: ProductDismissing
    private let specsViewController: UIViewController

    private func embedSpecsViewController() {
        addChild(specsViewController)
        productView.specsView.addSubview(specsViewController.view)
        specsViewController.view.layoutFill(productView.specsView)
        specsViewController.didMove(toParent: self)
    }

}
