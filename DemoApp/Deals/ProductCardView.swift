import UIKit

class ProductCardView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        layer.cornerRadius = 8
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

}
