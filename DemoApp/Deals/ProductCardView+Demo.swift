import UIKit

extension ProductCardView {
    static func oculus() -> ProductCardView {
        let view = ProductCardView()
        view.topBackgroundView.backgroundColor = .blackProduct
        view.imageView.image = .productOculus
        return view
    }
    static func surface() -> ProductCardView {
        let view = ProductCardView()
        view.topBackgroundView.backgroundColor = .blueProduct
        view.imageView.image = .productSurface
        return view
    }
    static func xbox() -> ProductCardView {
        let view = ProductCardView()
        view.topBackgroundView.backgroundColor = .greenProduct
        view.imageView.image = .productXbox
        return view
    }
}
