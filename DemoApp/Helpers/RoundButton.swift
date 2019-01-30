import UIKit

class RoundButton: UIControl {

    init() {
        super.init(frame: .zero)
        layer.apply(.roundButtonShadow)
        setupSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: Subviews

    let titleLabel = UILabel(frame: .zero) |> UILabel.roundButtonTitleStyle

    private let background = GradientView(style: .button)

    private func setupSubviews() {
        addSubview(background)
        addSubview(titleLabel)
        background.clipsToBounds = true
    }

    // MARK: Layout

    override func layoutSubviews() {
        super.layoutSubviews()
        background.layer.cornerRadius = background.frame.height / 2
    }

    private func setupLayout() {
        background.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: topAnchor),
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor),
            background.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }

}
