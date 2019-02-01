import UIKit

class TabBarView: UIView {

    init() {
        super.init(frame: .zero)
        setupSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: Subviews

    private let stackView = UIStackView(arrangedSubviews: [])
    private let indicatorView = GradientView(style: .button)

    private func setupSubviews() {
        addSubview(stackView)
        [imageView(with: .iconDeals, selected: true),
         imageView(with: .iconSearch),
         imageView(with: .iconCart),
         imageView(with: .iconProfile)].forEach {
            stackView.addArrangedSubview($0)
        }
        addSubview(indicatorView)
    }

    private func imageView(with image: UIImage, selected: Bool = false) -> UIImageView {
        let view = UIImageView(image: image.withRenderingMode(.alwaysTemplate))
        view.contentMode = .scaleAspectFit
        view.tintColor = selected ? .tabBarItemSelected : .tabBarItem
        return view
    }

    // MARK: Layout

    private func setupLayout() {
        layoutPinHeight(to: 52)

        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.layoutFill(self)

        indicatorView.layoutPinHeight(to: 4)
        indicatorView.layoutFillHorizontally(stackView.arrangedSubviews[0])
        indicatorView.layoutPinBottom(to: stackView.bottomAnchor)
    }

}
