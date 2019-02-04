@testable import EcommerceDemo

class ProductViewControllerCreatingDouble: ProductViewControllerCreating {

    private(set) var didCreateWithProduct: Product?
    var createdViewController = UIViewController()

    func create(with product: Product) -> UIViewController {
        didCreateWithProduct = product
        return createdViewController
    }

}
