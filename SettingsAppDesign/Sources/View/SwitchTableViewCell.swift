import UIKit
import SnapKit

final class SwitchTableViewCell: SettingsTableViewCell {

    // MARK: - Properties

    override class var сellIdentifier: String { "switchCellIdentifier" }

    // MARK: - Outlets

    private lazy var switchControl: UISwitch = {
        let switchControl = UISwitch()
        return switchControl
    }()

    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups

    override func setupHierarchy() {
        super.setupHierarchy()
        contentView.addSubview(switchControl)
    }

    override func setupLayout() {
        super.setupLayout()
        switchControl.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(contentView).inset(Constants.switchControlTrailingOffset)
        }
    }
}

// MARK: - Constants

extension SwitchTableViewCell {
    private struct Constants {
        static let switchControlTrailingOffset: CGFloat = 20
    }
}
