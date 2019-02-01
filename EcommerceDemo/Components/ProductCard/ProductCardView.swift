import UIKit

class ProductCardView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 8
        setupSubviews()
        setupLayout()
        setupAnimations()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    func adjust(forViewportCenterX viewportCenterX: CGFloat) {
        let distanceFromViewportCenterX = abs(frame.midX - viewportCenterX)
        let scrollAnimationProgress = min(1, max(0, distanceFromViewportCenterX / (bounds.width * 3)))
        scrollAnimator.fractionComplete = scrollAnimationProgress
    }

    // MARK: Subviews

    let topBackgroundView = UIView(frame: .zero)
    let imageView = UIImageView(frame: .zero) |> UIImageView.productStyle
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
        topView.addSubview(imageView)
        addSubview(centerView)
        centerView.addSubview(labelsStackView)
        labelsStackView.addArrangedSubview(nameLabel)
        labelsStackView.addArrangedSubview(priceLabel)
        addSubview(bottomView)
        bottomView.addSubview(button)
    }

    // MARK: Layout

    func updateImageViewLayout() {
        guard let image = imageView.image, image.size.width > 0 else { return }
        let aspectRatio = image.size.height / image.size.width
        imageViewHeightConstraint?.isActive = false
        imageViewHeightConstraint = imageView.heightAnchor.constraint(
            equalTo: imageView.widthAnchor,
            multiplier: aspectRatio
        )
        imageViewHeightConstraint?.isActive = true
    }

    private var imageViewHeightConstraint: NSLayoutConstraint?

    private func setupLayout() {
        layoutFillVerically(subviews: [
            (view: topView, heightMultiplier: 0.5),
            (view: centerView, heightMultiplier: nil),
            (view: bottomView, heightMultiplier: 0.22)
        ])

        topBackgroundView.layoutPinTop(to: topView.topAnchor)
        topBackgroundView.layoutFillHorizontally(topView)
        topBackgroundView.layoutPinHeight(to: topView.heightAnchor, multiplier: 0.77)

        imageView.layoutFillHorizontally(topView, leadingMargin: 20, trailingMargin: 20)
        imageView.layoutPinBottom(to: topView.bottomAnchor)

        labelsStackView.axis = .vertical
        labelsStackView.alignment = .center
        labelsStackView.spacing = 8
        labelsStackView.layoutCenterHorizontally(in: centerView, margin: 20)
        labelsStackView.layoutCenterVertically(in: centerView)

        button.layoutPinTop(to: bottomView.topAnchor)
        button.layoutCenterHorizontally(in: bottomView, margin: 20)
        button.layoutPinBottom(lessThan: bottomView.bottomAnchor)
    }

    // MARK: Animations

    private let scrollAnimator = UIViewPropertyAnimator(duration: 1, curve: .linear)

    private func setupAnimations() {
        scrollAnimator.addAnimations { [unowned self] in
            self.topBackgroundView.alpha = 0
            self.imageView.transform = CGAffineTransform(translationX: 0, y: -32)
        }
    }

}
