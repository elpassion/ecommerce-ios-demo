import UIKit

struct Product {
    struct Spec {
        let name: String
        let value: String
        let icon: UIImage
    }

    let name: String
    let price: String
    let color: UIColor
    let photo: UIImage
    let specs: [Spec]
}
