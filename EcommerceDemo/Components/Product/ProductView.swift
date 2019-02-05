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

    private let topView = UIView(frame: .zero)

    private func setupSubviews() {
        addSubview(scrollView)
        scrollView.alwaysBounceVertical = true
        scrollView.addSubview(topView)
        topView.addSubview(imageContainer)
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

        topView.layoutFill(scrollView)
        topView.layoutPinWidth(to: scrollView.safeAreaLayoutGuide.widthAnchor)
        topView.layoutPinHeight(to: topView.widthAnchor, multiplier: 0.75)

        imageContainer.layoutFillHorizontally(topView, leadingMargin: 20, trailingMargin: 20)
        imageContainer.layoutPinBottom(to: topView.bottomAnchor)
    }

}
