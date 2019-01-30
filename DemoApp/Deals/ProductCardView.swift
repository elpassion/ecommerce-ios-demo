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
        setupTopViewLayout()
        setupCenterViewLayout()
        setupBottomViewLayout()
    }

    private func setupTopViewLayout() {
        topView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topAnchor),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])

        topBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topBackgroundView.topAnchor.constraint(equalTo: topView.topAnchor),
            topBackgroundView.leadingAnchor.constraint(equalTo: topView.leadingAnchor),
            topBackgroundView.trailingAnchor.constraint(equalTo: topView.trailingAnchor),
            topBackgroundView.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.77)
        ])

        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -20),
            imageView.bottomAnchor.constraint(equalTo: topView.bottomAnchor)
        ])
    }

    private func setupCenterViewLayout() {
        centerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            centerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            centerView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])

        labelsStackView.axis = .vertical
        labelsStackView.alignment = .center
        labelsStackView.spacing = 8
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelsStackView.topAnchor.constraint(greaterThanOrEqualTo: centerView.topAnchor),
            labelsStackView.leadingAnchor.constraint(greaterThanOrEqualTo: centerView.leadingAnchor, constant: 20),
            labelsStackView.trailingAnchor.constraint(lessThanOrEqualTo: centerView.trailingAnchor, constant: -20),
            labelsStackView.bottomAnchor.constraint(lessThanOrEqualTo: centerView.bottomAnchor),
            labelsStackView.centerXAnchor.constraint(equalTo: centerView.centerXAnchor),
            labelsStackView.centerYAnchor.constraint(equalTo: centerView.centerYAnchor)
        ])
    }

    private func setupBottomViewLayout() {
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: centerView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.22)
        ])

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: bottomView.topAnchor),
            button.leadingAnchor.constraint(greaterThanOrEqualTo: bottomView.leadingAnchor),
            button.trailingAnchor.constraint(lessThanOrEqualTo: bottomView.trailingAnchor),
            button.bottomAnchor.constraint(lessThanOrEqualTo: bottomView.bottomAnchor),
            button.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor)
        ])
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
