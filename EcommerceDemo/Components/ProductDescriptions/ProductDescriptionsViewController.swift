import UIKit

class ProductDescriptionsViewController: UIViewController {

    init(descriptions: [Product.Description]) {
        self.descriptions = descriptions
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: View

    override func loadView() {
        let stackView = UIStackView(arrangedSubviews: descriptions.map { loadDescriptionView(with: $0) })
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        view = stackView
    }

    private func loadDescriptionView(with description: Product.Description) -> UIView {
        switch description {
        case .header(let text):
            return createContainer(
                with: UILabel(frame: .zero) |> UILabel.descriptionHeaderStyle |> UILabel.setText(text),
                horizontalMargins: 20
            )
        case .text(let text):
            return createContainer(
                with: UILabel(frame: .zero) |> UILabel.descriptionTextStyle |> UILabel.setText(text),
                horizontalMargins: 20
            )
        case .photo(let image):
            return ImageContainer(image: image)
        }
    }

    private func createContainer(with view: UIView, horizontalMargins margin: CGFloat = 0) -> UIView {
        let container = UIView(frame: .zero)
        container.addSubview(view)
        view.layoutFillVerically(container)
        view.layoutFillHorizontally(container, leadingMargin: margin, trailingMargin: margin)
        return container
    }

    // MARK: Private

    private let descriptions: [Product.Description]

}
