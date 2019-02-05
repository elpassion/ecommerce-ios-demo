import UIKit

extension UIBarButtonItem {
    static var close: UIBarButtonItem {
        let item = UIBarButtonItem(image: UIImage.iconX, style: .plain, target: nil, action: nil)
        item.tintColor = .white
        return item
    }
}
