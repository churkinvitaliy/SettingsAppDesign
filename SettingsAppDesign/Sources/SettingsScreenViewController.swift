import UIKit
import SnapKit

class SettingsScreenViewController: UIViewController {

    // MARK: - Properties

    private var settings = [[Setting]]()

    // MARK: - Outlets

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.сellIdentifier)
        tableView.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.сellIdentifier)
        tableView.register(TextStatusTableViewCell.self, forCellReuseIdentifier: TextStatusTableViewCell.сellIdentifier)

        tableView.delegate = self
        tableView.dataSource = self

        let topInset: CGFloat = Constants.tableViewTopInset
        tableView.contentInset = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)

        let separatorView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: Constants.tableViewSeparatorHeight))
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
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupHierarchy() {
        view.addSubview(tableView)
    }

    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(Constants.topMarginTable)
            make.left.bottom.right.equalToSuperview()
        }
    }
}

// MARK: - Constants

extension SettingsScreenViewController {
    struct Constants {
        static let topMarginTable: CGFloat = 20
        static let tableViewTopInset: CGFloat = 20
        static let tableViewSeparatorHeight: CGFloat = 1
        static let tableViewRowHeight: CGFloat = 44
    }
}

// MARK: - Delegate, DataSource

extension SettingsScreenViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.tableViewRowHeight
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        settings.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings[section].count
    }

    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        let setting = settings[indexPath.section][indexPath.row]

        if case .switchSetting = setting.type {
            return false
        }

        return true
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = settings[indexPath.section][indexPath.row]

        switch setting.type {
        case .switchSetting:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.сellIdentifier,
                for: indexPath
            ) as? SwitchTableViewCell ?? SwitchTableViewCell()
            cell.setting = setting
            return cell
        case .statusSetting(let statusText):
            let cell = tableView.dequeueReusableCell(
                withIdentifier: TextStatusTableViewCell.сellIdentifier,
                for: indexPath
            ) as? TextStatusTableViewCell ?? TextStatusTableViewCell()
            cell.setting = setting
            cell.accessoryType = .disclosureIndicator
            return cell
        default:
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
        let setting = settings[indexPath.section][indexPath.row]
        detailVC.setting = setting
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
