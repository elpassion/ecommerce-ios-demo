import UIKit

class DealsView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .darkBackground
        setupSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: Subviews

    let titleLabel = UILabel(frame: .zero) |> UILabel.titleStyle

    var productViews: [UIView] = [] {
        didSet {
            oldValue.forEach { $0.removeFromSuperview() }
            productViews.forEach {
                stackView.addArrangedSubview($0)
                setupLayout(cardView: $0)
            }
        }
    }

    let scrollView = UIScrollView(frame: .zero)

    private let stackView = UIStackView(arrangedSubviews: [])

    private func setupSubviews() {
        addSubview(titleLabel)
        addSubview(scrollView)
        scrollView.decelerationRate = .fast
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.addSubview(stackView)
    }

    // MARK: Layout

    private func setupLayout() {
        titleLabel.layoutPinTop(to: safeAreaLayoutGuide.topAnchor, margin: 22)
        titleLabel.layoutCenterHorizontally(in: safeAreaLayoutGuide, margin: 22)

        scrollView.contentInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        scrollView.layoutPinTop(to: titleLabel.bottomAnchor, margin: 44)
        scrollView.layoutFillHorizontally(self)
        scrollView.layoutPinBottom(to: safeAreaLayoutGuide.bottomAnchor, margin: 78)

        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 24
        stackView.layoutFill(scrollView)
        stackView.layoutPinHeight(to: scrollView.heightAnchor)
    }

    private func setupLayout(cardView view: UIView) {
        view.layoutPinWidth(
            to: scrollView.safeAreaLayoutGuide.widthAnchor,
            delta: -scrollView.adjustedContentInset.horizontal
        )
    }

}
