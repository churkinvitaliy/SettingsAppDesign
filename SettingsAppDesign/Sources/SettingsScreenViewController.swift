import UIKit
import SnapKit

class SettingsScreenViewController: UIViewController {

    // MARK: - Properties

    private var settings: [[Setting]]?

    // MARK: - Outlets

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.сellIdentifier)
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.сellIdentifier)
        tableView.register(TextStatusTableViewCell.self, forCellReuseIdentifier: TextStatusTableViewCell.сellIdentifier)

        tableView.delegate = self
        tableView.dataSource = self

        let topInset: CGFloat = 20
        tableView.contentInset = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)

        let separatorView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 1))
        separatorView.backgroundColor = UIColor.systemGray4

        tableView.tableHeaderView = separatorView
        return tableView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        settings = Setting.settings
        setupView()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setups

    private func setupView() {
        view.backgroundColor = .white
        title = "Настройки"
    }

    private func setupHierarchy() {
        view.addSubview(tableView)
    }

    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalToSuperview()
        }
    }
}

extension SettingsScreenViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44.7
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        settings?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings?[section].count ?? 0
    }

    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        guard let setting = settings?[indexPath.section][indexPath.row] else {
            return false
        }

        return !setting.hasSwitch
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let setting = settings?[indexPath.section][indexPath.row] else {
            return UITableViewCell()
        }

        if setting.hasSwitch {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.сellIdentifier,
                for: indexPath
            ) as? SwitchTableViewCell ?? SwitchTableViewCell()
            cell.setting = setting
            return cell

        } else if setting.hasStatus {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: TextStatusTableViewCell.сellIdentifier,
                for: indexPath
            ) as? TextStatusTableViewCell ?? TextStatusTableViewCell()
            cell.setting = setting
            cell.accessoryType = .disclosureIndicator
            return cell

        } else {
            let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingsTableViewCell.сellIdentifier,
                for: indexPath
            ) as? SettingsTableViewCell ?? SettingsTableViewCell()
            cell.setting = setting
            cell.accessoryType = .disclosureIndicator
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = DetailViewController()
        let setting = settings?[indexPath.section][indexPath.row]
        detailVC.setting = setting
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
