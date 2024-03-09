import UIKit
import SnapKit

class SettingsTableViewCell: UITableViewCell {

    // MARK: - Properties

    private let listPossibleColors: [String: UIColor] = [
        "systemOrange": .systemOrange,
        "systemGreen": .systemGreen,
        "systemRed": .systemRed,
        "systemBlue": .systemBlue,
        "systemIndigo": .systemIndigo,
        "systemGray": .systemGray
    ]

    var setting: Setting? {
        didSet {
            if let setting = setting {
                switch setting.nameSetting {
                case "Bluetooth":
                    iconCell.image = UIImage(named: setting.nameIcon)
                default:
                    iconCell.image = UIImage(systemName: setting.nameIcon)
                }

                backgroundIcons.backgroundColor = listPossibleColors[setting.backgroundIcon] ?? UIColor()
                nameCell.text = setting.nameSetting
            }
        }
    }

    class var сellIdentifier: String { "settingsCellIdentifier" }

    // MARK: - Outlets

    private lazy var backgroundIcons: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.colorIconCornerRadius
        return view
    }()

    private lazy var iconCell: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.tintColor = .white
        return imageView
    }()

    private lazy var nameCell: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constants.fontSize, weight: .regular)
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

    func setupHierarchy() {
        backgroundIcons.addSubview(iconCell)
        contentView.addSubview(backgroundIcons)
        contentView.addSubview(nameCell)
    }

    func setupLayout() {
        iconCell.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.width.equalTo(Constants.iconSize)
        }

        backgroundIcons.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(contentView).offset(Constants.iconBackgroundLeadingOffset)
            make.height.width.equalTo(Constants.backgroundIconSize)
        }

        nameCell.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(backgroundIcons.snp.right).offset(Constants.nameCellLeadingOffset)
        }
    }
}

// MARK: - Constants

extension SettingsTableViewCell {
    struct Constants {
        static let colorIconCornerRadius: CGFloat = 7
        static let iconSize: CGFloat = 23
        static let backgroundIconSize: CGFloat = 33
        static let iconBackgroundLeadingOffset: CGFloat = 20
        static let nameCellLeadingOffset: CGFloat = 20
        static let fontSize: CGFloat = 16
    }
}
