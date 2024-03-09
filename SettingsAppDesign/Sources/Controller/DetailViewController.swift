import UIKit

class DetailViewController: UIViewController {

    // MARK: - Properties

    var setting: Setting?

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Setups

    private func setupView() {
        view.backgroundColor = .white
        title = setting?.nameSetting
    }
}
