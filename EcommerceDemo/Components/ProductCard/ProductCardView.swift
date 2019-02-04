import UIKit

class ProductCardView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 8
        setupSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: Subviews

    let topBackgroundView = UIView(frame: .zero)
    let imageContainer = ImageContainer()
    let nameLabel = UILabel(frame: .zero) |> UILabel.productNameStyle
    let priceLabel = UILabel(frame: .zero) |> UILabel.priceStyle
    let button = RoundButton()

    private let topView = UIView(frame: .zero)
    private let centerView = UIView(frame: .zero)
    private let labelsStackView = UIStackView(arrangedSubviews: [])
    private let bottomView = UIView(frame: .zero)

    private func setupSubviews() {
        addSubview(topView)
        topView.addSubview(topBackgroundView)
        topView.addSubview(imageContainer)
        addSubview(centerView)
        centerView.addSubview(labelsStackView)
        labelsStackView.addArrangedSubview(nameLabel)
        labelsStackView.addArrangedSubview(priceLabel)
        addSubview(bottomView)
        bottomView.addSubview(button)
    }

    // MARK: Layout

    private func setupLayout() {
        layoutFillVerically(subviews: [
            (view: topView, heightMultiplier: 0.5),
            (view: centerView, heightMultiplier: nil),
            (view: bottomView, heightMultiplier: 0.22)
        ])

        topBackgroundView.layoutPinTop(to: topView.topAnchor)
        topBackgroundView.layoutFillHorizontally(topView)
        topBackgroundView.layoutPinHeight(to: topView.heightAnchor, multiplier: 0.77)

        imageContainer.layoutFillHorizontally(topView, leadingMargin: 20, trailingMargin: 20)
        imageContainer.layoutPinBottom(to: topView.bottomAnchor)

        labelsStackView.axis = .vertical
        labelsStackView.alignment = .center
        labelsStackView.spacing = 8
        labelsStackView.layoutCenterHorizontally(in: centerView, margin: 20)
        labelsStackView.layoutCenterVertically(in: centerView)

        button.layoutPinTop(to: bottomView.topAnchor)
        button.layoutCenterHorizontally(in: bottomView, margin: 20)
        button.layoutPinBottom(lessThan: bottomView.bottomAnchor)
    }

}
