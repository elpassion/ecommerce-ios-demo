import UIKit

struct DealsViewControllerFactory: DealsViewControllerCreating {

    var cardViewControllerFactory: ProductCardViewControllerCreating = ProductCardViewControllerFactory()

    func create(with produtcs: [Product]) -> UIViewController {
        return DealsViewController(
            cardViewControllers: produtcs.map { cardViewControllerFactory.create(with: $0) }
        )
    }

}
