import UIKit
import SnapKit

class TextStatusTableViewCell: SettingsTableViewCell {

    // MARK: - Properties

    override var setting: Setting? {
        didSet {
            if let setting = setting {
                switch setting.type {
                case .statusSetting(let statusText):
                    textStatus.text = statusText
                default:
                    break
                }
            }
        }
    }

    override class var сellIdentifier: String { "textStatusCellIdentifier" }

    // MARK: - Outlets

    private lazy var textStatus: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constants.textStatusFontSize, weight: .regular)
        label.textColor = .systemGray
        label.textAlignment = .left
        return label
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
        contentView.addSubview(textStatus)
    }

    override func setupLayout() {
        super.setupLayout()
        textStatus.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(contentView).inset(Constants.textStatusTrailingOffset)
        }
    }
}

// MARK: - Constants

extension TextStatusTableViewCell {
    struct Constants {
        static let textStatusFontSize: CGFloat = 15
        static let textStatusTrailingOffset: CGFloat = 20
    }
}
