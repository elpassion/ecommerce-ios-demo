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

    private func setupSubviews() {
        addSubview(topBackgroundView)
        addSubview(imageView)
    }

    // MARK: Layout

    private func setupLayout() {
        topBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            topBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topBackgroundView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.39)
        ])

        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            imageView.centerYAnchor.constraint(equalTo: topBackgroundView.bottomAnchor, constant: -10)
        ])
    }

    // MARK: Animations

    private let scrollAnimator = UIViewPropertyAnimator(duration: 1, curve: .linear)

    private func setupAnimations() {
        scrollAnimator.addAnimations { [unowned self] in
            self.topBackgroundView.alpha = 0
        }
    }

}
