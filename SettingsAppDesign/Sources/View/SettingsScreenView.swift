import UIKit
import SnapKit

protocol SettingsScreenViewDelegate: AnyObject {
    func didSelectSetting(_ setting: Setting)
}

final class SettingsScreenView: UIView {

    // MARK: - Properties

    private var settings: [[Setting]] = [[]]
    weak var delegate: SettingsScreenViewDelegate?

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

        let separatorView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: Constants.tableViewSeparatorHeight))
        separatorView.backgroundColor = UIColor.systemGray4

        tableView.tableHeaderView = separatorView
        return tableView
    }()

    // MARK: - Initial

    init() {
        super.init(frame: .zero)
        loadData()
        setupView()
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups

    private func setupView() {
        backgroundColor = .white
    }

    private func setupHierarchy() {
        addSubview(tableView)
    }

    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constants.topMarginTable)
            make.left.bottom.right.equalToSuperview()
        }
    }

    private func loadData() {
        settings = SettingsModel().getSettings()
    }
}

// MARK: - Constants

extension SettingsScreenView {
    private struct Constants {
        static let topMarginTable: CGFloat = 20
        static let tableViewTopInset: CGFloat = 20
        static let tableViewSeparatorHeight: CGFloat = 1
        static let tableViewRowHeight: CGFloat = 44
    }
}

// MARK: - Delegate, DataSource

extension SettingsScreenView: UITableViewDelegate, UITableViewDataSource {

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

            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.сellIdentifier,
                for: indexPath
            ) as? SwitchTableViewCell else { return UITableViewCell() }

            cell.setting = setting
            return cell
        case .statusSetting(_):

            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TextStatusTableViewCell.сellIdentifier,
                for: indexPath
            ) as? TextStatusTableViewCell else { return UITableViewCell() }

            cell.setting = setting
            cell.accessoryType = .disclosureIndicator
            return cell
        default:

            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingsTableViewCell.сellIdentifier,
                for: indexPath
            ) as? SettingsTableViewCell else { return UITableViewCell() }

            cell.setting = setting
            cell.accessoryType = .disclosureIndicator
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedSetting = settings[indexPath.section][indexPath.row]
        delegate?.didSelectSetting(selectedSetting)
    }

}
