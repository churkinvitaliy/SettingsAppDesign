import UIKit
import SnapKit

final class SettingsScreenViewController: UIViewController {

    // MARK: - Properties

    private var settingsScreenView: SettingsScreenView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsScreenView
    }

    // MARK: - Lifecycle

    override func loadView() {
        view = SettingsScreenView()
        settingsScreenView?.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - SettingsScreenViewDelegate

extension SettingsScreenViewController: SettingsScreenViewDelegate {
    func didSelectSetting(_ setting: Setting) {
        let detailVC = DetailViewController()
        detailVC.setting = setting
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
