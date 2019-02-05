import UIKit

class ProductView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: Subviews

    let closeButton = UIButton(frame: .zero) |> UIButton.closeStyle
    let topBackgroundView = UIView(frame: .zero)
    let imageContainer = ImageContainer()

    private let topView = UIView(frame: .zero)

    private func setupSubviews() {
        addSubview(topView)
        topView.addSubview(topBackgroundView)
        topView.addSubview(imageContainer)
        addSubview(closeButton)
    }

    // MARK: Layout

    private func setupLayout() {
        closeButton.layoutPinTop(to: safeAreaLayoutGuide.topAnchor, margin: 10)
        closeButton.layoutPinLeading(to: safeAreaLayoutGuide.leadingAnchor, margin: 6)

        topView.layoutPinTop(to: topAnchor)
        topView.layoutFillHorizontally(self)
        topView.layoutPinHeight(to: topView.widthAnchor, multiplier: 0.8)

        topBackgroundView.layoutPinTop(to: topView.topAnchor)
        topBackgroundView.layoutFillHorizontally(topView)
        topBackgroundView.layoutPinHeight(to: topView.heightAnchor, multiplier: 0.77)

        imageContainer.layoutFillHorizontally(topView, leadingMargin: 20, trailingMargin: 20)
        imageContainer.layoutPinBottom(to: topView.bottomAnchor)
    }

}
