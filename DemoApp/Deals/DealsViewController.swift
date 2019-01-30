import UIKit

class DealsViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func loadView() {
        view = DealsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dealsView.titleLabel.text = "Today’s deals"
        dealsView.productViews = [
            ProductCardView(),
            ProductCardView(),
            ProductCardView(),
            ProductCardView(),
            ProductCardView()
        ]
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    private var dealsView: DealsView! {
        return view as? DealsView
    }

}
