import UIKit

class ProductSpecsViewController: UIViewController {

    init(specs: [Product.Spec]) {
        self.specs = specs
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: View

    override func loadView() {
        let stackView = UIStackView(arrangedSubviews: specs.map { spec in loadSpecView(with: spec) })
        stackView.axis = .horizontal
        stackView.alignment = .bottom
        stackView.distribution = .equalSpacing
        view = stackView
    }

    private func loadSpecView(with spec: Product.Spec) -> UIView {
        let stackView = UIStackView(arrangedSubviews: [
            UIImageView(image: spec.icon),
            UILabel(frame: .zero) |> UILabel.specValueStyle |> UILabel.setText(spec.value),
            UILabel(frame: .zero) |> UILabel.specNameStyle |> UILabel.setText(spec.name)
        ])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.setCustomSpacing(8, after: stackView.arrangedSubviews[0])
        stackView.setCustomSpacing(3, after: stackView.arrangedSubviews[1])
        return stackView
    }

    // MARK: Private

    private let specs: [Product.Spec]

}
