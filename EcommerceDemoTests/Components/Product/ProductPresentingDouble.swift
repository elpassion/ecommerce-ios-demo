@testable import EcommerceDemo

class ProductPresentingDouble: ProductPresenting {
    private(set) var didPresentProduct: Product?
    private(set) var didPresentFrom: UIViewController?

    func present(_ product: Product, from presenting: UIViewController) {
        didPresentProduct = product
        didPresentFrom = presenting
    }
}
