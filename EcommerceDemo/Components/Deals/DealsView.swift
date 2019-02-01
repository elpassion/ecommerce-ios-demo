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
                setupLayout(productView: $0)
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
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 22),
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])

        scrollView.contentInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 44),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -78)
        ])

        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 24
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.heightAnchor)
        ])
    }

    private func setupLayout(productView view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(
                equalTo: scrollView.safeAreaLayoutGuide.widthAnchor,
                constant: -scrollView.adjustedContentInset.horizontal
            )
        ])
    }

}
