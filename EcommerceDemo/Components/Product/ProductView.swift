import UIKit

class ProductView: UIView {

    init() {
        super.init(frame: .zero)
        setupSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: Subviews

    let closeButton = UIButton(frame: .zero)

    private func setupSubviews() {
        closeButton.setImage(UIImage.iconX, for: .normal)
        addSubview(closeButton)
    }

    // MARK: Layout

    private func setupLayout() {
        closeButton.layoutPinTop(to: safeAreaLayoutGuide.topAnchor, margin: 10)
        closeButton.layoutPinLeading(to: safeAreaLayoutGuide.leadingAnchor, margin: 6)
        closeButton.layoutPinWidth(to: 44)
        closeButton.layoutPinHeight(to: 44)
    }

}
