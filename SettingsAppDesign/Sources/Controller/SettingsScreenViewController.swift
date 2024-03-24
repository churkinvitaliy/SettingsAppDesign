import UIKit
import SnapKit

final class SettingsScreenViewController: UIViewController {

    // MARK: - Properties

    private var settingsScreenView: SettingsScreenView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsScreenView
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Setups

    private func setupView() {
        view = SettingsScreenView()
        settingsScreenView?.delegate = self
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
