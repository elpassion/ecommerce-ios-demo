import UIKit

class ImageContainer: UIView {

    init(image: UIImage? = nil) {
        self.image = image
        super.init(frame: .zero)
        setupSubviews()
        setupLayout()
        updateImage()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    var image: UIImage? {
        didSet { updateImage() }
    }

    // MARK: Subviews

    let imageView = UIImageView(frame: .zero)

    private func setupSubviews() {
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
    }

    // MARK: Layout

    private func setupLayout() {
        imageView.layoutFill(self)
    }

    private var heightConstraint: NSLayoutConstraint? {
        didSet {
            oldValue?.isActive = false
            heightConstraint?.isActive = true
        }
    }

    private func createHeightConstraint() -> NSLayoutConstraint? {
        guard let image = image, image.size.width > 0 else {
            return nil
        }
        let aspectRatio = image.size.height / image.size.width
        return imageView.heightAnchor.constraint(
            equalTo: imageView.widthAnchor,
            multiplier: aspectRatio
        )
    }

    // MARK: Private

    private func updateImage() {
        imageView.image = image
        heightConstraint = createHeightConstraint()
    }

}
