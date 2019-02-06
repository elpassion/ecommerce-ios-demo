import UIKit

class ProductViewController: UIViewController, UIToolbarDelegate {

    init(product: Product,
         specsViewController: UIViewController,
         descriptionsViewController: UIViewController,
         dismisser: ProductDismissing) {
        self.product = product
        self.specsViewController = specsViewController
        self.descriptionsViewController = descriptionsViewController
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
        productView.imageContainer.image = product.photo
        productView.nameLabel.text = product.name
        productView.toolbar.delegate = self
        productView.closeButton.target = self
        productView.closeButton.action = #selector(closeButtonAction)
        productView.addToCartButton.titleLabel.text = "\(product.price) - Add to cart"
        embed(specsViewController, in: productView.specsView)
        embed(descriptionsViewController, in: productView.descriptionsView)
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
    private let descriptionsViewController: UIViewController

    private func embed(_ viewController: UIViewController, in view: UIView) {
        addChild(viewController)
        view.addSubview(viewController.view)
        viewController.view.layoutFill(view)
        viewController.didMove(toParent: self)
    }

}
