import UIKit

class DealsViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func loadView() {
        view = UIView(frame: .zero)
        view.backgroundColor = .white
    }

}
