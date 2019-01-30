import UIKit

extension ProductCardView {
    static func oculus() -> ProductCardView {
        let view = ProductCardView()
        view.topBackgroundView.backgroundColor = .blackProduct
        view.imageView.image = .productOculus
        view.updateImageViewLayout()
        view.nameLabel.text = "Oculus Rift"
        view.priceLabel.text = "$1 299"
        return view
    }
    static func surface() -> ProductCardView {
        let view = ProductCardView()
        view.topBackgroundView.backgroundColor = .blueProduct
        view.imageView.image = .productSurface
        view.updateImageViewLayout()
        view.nameLabel.text = "Surface Pro 4"
        view.priceLabel.text = "$1 299"
        return view
    }
    static func xbox() -> ProductCardView {
        let view = ProductCardView()
        view.topBackgroundView.backgroundColor = .greenProduct
        view.imageView.image = .productXbox
        view.updateImageViewLayout()
        view.nameLabel.text = "xBox One"
        view.priceLabel.text = "$699"
        return view
    }
}
