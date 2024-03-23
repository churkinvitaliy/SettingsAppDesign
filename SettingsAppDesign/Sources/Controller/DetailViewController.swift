import UIKit

final class DetailViewController: UIViewController {

    // MARK: - Properties

    private var detailView: DetailView? {
        guard isViewLoaded else { return nil }
        return view as? DetailView
    }

    var setting: Setting?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureView()
    }

    // MARK: - Setups

    private func setupView() {
        view = DetailView()
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

extension DetailViewController {
    private func configureView() {
        guard let setting else { return }
        title = setting.nameSetting
        detailView?.configureView(with: setting)
    }
}
