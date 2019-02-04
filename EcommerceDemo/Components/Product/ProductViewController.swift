import UIKit

class ProductViewController: UIViewController {

    init(product: Product, dismisser: ProductDismissing) {
        self.product = product
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
        productView.backgroundColor = product.color
    }

    private var productView: ProductView! {
        return view as? ProductView
    }

    // MARK: Private

    private let product: Product
    private let dismisser: ProductDismissing

}
