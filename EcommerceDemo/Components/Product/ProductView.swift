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
    let separatorView = UIView(frame: .zero)
    let descriptionsView = UIView(frame: .zero)
    let addToCartButton = RoundButton()

    private let topView = UIView(frame: .zero)
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
        updateLayout()
    }

    func updateLayout() {
        layoutTopBackground()
        layoutNameLabel()
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

    private func layoutTopBackground() {
        let minHeight = scrollView.adjustedContentInset.top
        let maxHeight = minHeight + topView.frame.minY + topView.frame.height * 0.66
        let height = maxHeight - scrollView.contentOffset.y - scrollView.adjustedContentInset.top
        topBackgroundView.frame = CGRect(
            x: -scrollView.adjustedContentInset.left,
            y: scrollView.contentOffset.y,
            width: scrollView.frame.width,
            height: max(minHeight, min(maxHeight, height))
        )
    }

    private func layoutNameLabel() {
        let center = nameLabel.center.y - scrollView.contentOffset.y - scrollView.adjustedContentInset.top
        let toolbarCenter = toolbar.frame.height / 2
        let translationY = center <= -toolbarCenter ? -(center + toolbarCenter) : 0
        let progress = max(0, min(1, (center - toolbarCenter) / -(toolbarCenter + toolbarCenter)))
        let scale = 0.625 + 0.375 * (1 - progress)
        nameLabel.transform = CGAffineTransform.identity
            .translatedBy(x: 0, y: translationY)
            .scaledBy(x: scale, y: scale)
        let white = 0.153 + 0.847 * progress
        nameLabel.textColor = UIColor(white: white, alpha: 1)
    }

}
