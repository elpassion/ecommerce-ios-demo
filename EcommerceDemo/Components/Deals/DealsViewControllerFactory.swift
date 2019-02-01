import UIKit

struct DealsViewControllerFactory: DealsViewControllerCreating {
    func create() -> UIViewController {
        return DealsViewController(products: [.oculus, .surface, .xbox])
    }
}
