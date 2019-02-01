import UIKit

class ProductCardViewController: UIViewController {

    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: View

    override func loadView() {
        view = ProductCardView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        productCardView.topBackgroundView.backgroundColor = product.color
        productCardView.imageView.image = product.image
        productCardView.updateImageViewLayout()
        productCardView.nameLabel.text = product.name
        productCardView.priceLabel.text = product.price
        productCardView.button.titleLabel.text = "Show more"
    }

    private var productCardView: ProductCardView! {
        return view as? ProductCardView
    }

    // MARK: Private

    private let product: Product

}
