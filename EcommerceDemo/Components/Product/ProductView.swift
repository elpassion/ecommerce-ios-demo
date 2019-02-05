import UIKit

class ProductView: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: Subviews

    let toolbar = UIToolbar(frame: .zero) |> UIToolbar.topStyle
    let closeButton = UIBarButtonItem.close
    let scrollView = UIScrollView(frame: .zero)
    let imageContainer = ImageContainer()
    let nameLabel = UILabel(frame: .zero) |> UILabel.productNameStyle
    let specsView = UIView(frame: .zero)
    let descriptionsView = UIView(frame: .zero)

    private let topView = UIView(frame: .zero)

    private func setupSubviews() {
        addSubview(scrollView)
        scrollView.alwaysBounceVertical = true
        scrollView.addSubview(topView)
        topView.addSubview(imageContainer)
        scrollView.addSubview(nameLabel)
        scrollView.addSubview(specsView)
        scrollView.addSubview(descriptionsView)
        addSubview(toolbar)
        toolbar.items = [closeButton]
    }

    // MARK: Layout

    override func layoutSubviews() {
        super.layoutSubviews()
        scrollView.contentInset.top = toolbar.frame.height
        scrollView.scrollIndicatorInsets.top = toolbar.frame.height
    }

    private func setupLayout() {
        toolbar.layoutPinTop(to: safeAreaLayoutGuide.topAnchor)
        toolbar.layoutFillHorizontally(safeAreaLayoutGuide)

        scrollView.layoutFill(self)

        topView.layoutPinTop(to: scrollView.topAnchor)
        topView.layoutFillHorizontally(scrollView)
        topView.layoutPinWidth(to: scrollView.safeAreaLayoutGuide.widthAnchor)
        topView.layoutPinHeight(to: topView.widthAnchor, multiplier: 0.75)

        imageContainer.layoutFillHorizontally(topView, leadingMargin: 20, trailingMargin: 20)
        imageContainer.layoutPinBottom(to: topView.bottomAnchor)

        nameLabel.layoutPinTop(to: topView.bottomAnchor, margin: 15)
        nameLabel.layoutCenterHorizontally(in: scrollView, margin: 25)

        specsView.layoutPinTop(to: nameLabel.bottomAnchor, margin: 20)
        specsView.layoutFillHorizontally(scrollView, leadingMargin: 20, trailingMargin: 20)

        descriptionsView.layoutPinTop(to: specsView.bottomAnchor, margin: 30)
        descriptionsView.layoutFillHorizontally(scrollView)
        descriptionsView.layoutPinBottom(to: scrollView.bottomAnchor, margin: 30)
    }

}
