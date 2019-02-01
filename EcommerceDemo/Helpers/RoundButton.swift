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
        background.layoutFill(self)
        titleLabel.layoutFill(self, margins: UIEdgeInsets(top: 16, left: 30, bottom: 16, right: 30))
    }

}
