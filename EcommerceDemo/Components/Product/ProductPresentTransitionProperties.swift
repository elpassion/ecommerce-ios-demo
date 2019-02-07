import UIKit

struct ProductPresentTransitionProperties {
    let frame: CGRect
    let cornerRadius: CGFloat
    let toolbarAlpha: CGFloat
    let topBackgroundFrame: CGRect
    let imageFrame: CGRect
    let nameFrame: CGRect
    let specsAlpha: CGFloat
    let separatorAlpha: CGFloat
    let descriptionsAlpha: CGFloat

    static func from(_ productView: ProductView) -> ProductPresentTransitionProperties {
        return ProductPresentTransitionProperties(
            frame: productView.frame,
            cornerRadius: productView.layer.cornerRadius,
            toolbarAlpha: productView.toolbar.alpha,
            topBackgroundFrame: productView.topBackgroundView.frame,
            imageFrame: productView.imageContainer.frame,
            nameFrame: productView.nameLabel.frame,
            specsAlpha: productView.specsView.alpha,
            separatorAlpha: productView.separatorView.alpha,
            descriptionsAlpha: productView.descriptionsView.alpha
        )
    }

    static func presented(
        productView: ProductView,
        container: UIView
    ) -> ProductPresentTransitionProperties {
        productView.frame = container.bounds
        productView.setNeedsLayout()
        productView.layoutIfNeeded()
        return ProductPresentTransitionProperties.from(productView)
    }

    static func dismissed(
        productView: ProductView,
        cardView: ProductCardView,
        container: UIView
    ) -> ProductPresentTransitionProperties {
        productView.frame = cardView.convert(cardView.bounds, to: productView.superview)
        productView.setNeedsLayout()
        productView.layoutIfNeeded()
        return ProductPresentTransitionProperties(
            frame: productView.frame,
            cornerRadius: cardView.layer.cornerRadius,
            toolbarAlpha: 0,
            topBackgroundFrame: cardView.topBackgroundView.convert(
                cardView.topBackgroundView.bounds,
                to: productView.topBackgroundView.superview
            ),
            imageFrame: cardView.imageContainer.convert(
                cardView.imageContainer.bounds,
                to: productView.imageContainer.superview
            ),
            nameFrame: cardView.nameLabel.convert(
                cardView.nameLabel.bounds,
                to: productView.nameLabel.superview
            ),
            specsAlpha: 0,
            separatorAlpha: 0,
            descriptionsAlpha: 0
        )
    }

    func apply(to view: ProductView) {
        view.frame = frame
        view.setNeedsLayout()
        view.layoutIfNeeded()
        view.layer.cornerRadius = cornerRadius
        view.toolbar.alpha = toolbarAlpha
        view.topBackgroundView.frame = topBackgroundFrame
        view.imageContainer.frame = imageFrame
        view.nameLabel.frame = nameFrame
        view.specsView.alpha = specsAlpha
        view.separatorView.alpha = separatorAlpha
        view.descriptionsView.alpha = descriptionsAlpha
    }
}
