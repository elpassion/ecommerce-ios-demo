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

    let titleLabel = UILabel(frame: .zero) |> UILabel.titleStyle

    private func setupSubviews() {
        addSubview(titleLabel)
    }

    private func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 22),
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor)
        ])
    }

}
