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
    let topBackgroundView = UIView(frame: .zero)
    let imageContainer = ImageContainer()
    let nameLabel = UILabel(frame: .zero) |> UILabel.productNameStyle
    let specsView = UIView(frame: .zero)
    let descriptionsView = UIView(frame: .zero)
    let addToCartButton = RoundButton()

    private let topView = UIView(frame: .zero)
    private let separatorView = UIView(frame: .zero)
    private let bottomView = UIView(frame: .zero)
    private let bottomGradientView = GradientView(style: .bottomWhiteShade)

    private func setupSubviews() {
        addSubview(scrollView)
        addSubview(bottomView)
        addSubview(toolbar)

        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.addSubview(specsView)
        scrollView.addSubview(separatorView)
        scrollView.addSubview(descriptionsView)
        scrollView.addSubview(topBackgroundView)
        scrollView.addSubview(topView)
        scrollView.addSubview(nameLabel)

        topView.addSubview(imageContainer)

        bottomView.addSubview(bottomGradientView)
        bottomView.addSubview(addToCartButton)

        toolbar.items = [closeButton, .flexibleSpace, .star]

        separatorView.backgroundColor = .separator
    }

    // MARK: Layout

    override func layoutSubviews() {
        super.layoutSubviews()
        scrollView.contentInset.top = toolbar.frame.height
        scrollView.contentInset.bottom = bottomView.frame.height - scrollView.safeAreaInsets.bottom
        layoutTopBackground()
    }

    func layoutTopBackground() {
        topBackgroundView.frame = CGRect(
            x: -scrollView.adjustedContentInset.left,
            y: scrollView.contentOffset.y,
            width: scrollView.frame.width,
            height: scrollView.adjustedContentInset.top + topView.frame.height * 0.66
        )
    }

    private func setupLayout() {
        toolbar.layoutPinTop(to: safeAreaLayoutGuide.topAnchor)
        toolbar.layoutFillHorizontally(safeAreaLayoutGuide)

        scrollView.layoutFill(self)

        topView.layoutPinTop(to: scrollView.topAnchor)
        topView.layoutFillHorizontally(scrollView)
        topView.layoutPinWidth(to: scrollView.safeAreaLayoutGuide.widthAnchor)
        topView.layoutPinHeight(to: topView.widthAnchor, multiplier: 0.6)

        imageContainer.layoutFillHorizontally(topView, leadingMargin: 20, trailingMargin: 20)
        imageContainer.layoutPinBottom(to: topView.bottomAnchor)

        nameLabel.layoutPinTop(to: topView.bottomAnchor, margin: 15)
        nameLabel.layoutCenterHorizontally(in: scrollView, margin: 25)

        specsView.layoutPinTop(to: nameLabel.bottomAnchor, margin: 20)
        specsView.layoutFillHorizontally(scrollView, leadingMargin: 20, trailingMargin: 20)

        separatorView.layoutPinTop(to: specsView.bottomAnchor, margin: 27)
        separatorView.layoutFillHorizontally(scrollView)
        separatorView.layoutPinHeight(to: 1)

        descriptionsView.layoutPinTop(to: separatorView.bottomAnchor, margin: 24)
        descriptionsView.layoutFillHorizontally(scrollView)
        descriptionsView.layoutPinBottom(to: scrollView.bottomAnchor)

        bottomView.layoutFillHorizontally(self)
        bottomView.layoutPinBottom(to: bottomAnchor)

        bottomGradientView.layoutFill(bottomView)

        addToCartButton.layoutPinTop(to: bottomView.topAnchor, margin: 30)
        addToCartButton.layoutCenterHorizontally(in: safeAreaLayoutGuide)
        addToCartButton.layoutPinBottom(to: bottomView.safeAreaLayoutGuide.bottomAnchor, margin: 30)
    }

}
