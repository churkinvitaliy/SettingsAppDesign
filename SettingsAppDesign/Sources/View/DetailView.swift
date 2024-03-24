import UIKit
import SnapKit

final class DetailView: UIView {

    // MARK: - Properties
    
    private let listPossibleColors: [String: UIColor] = [
        "systemOrange": .systemOrange,
        "systemGreen": .systemGreen,
        "systemRed": .systemRed,
        "systemBlue": .systemBlue,
        "systemIndigo": .systemIndigo,
        "systemGray": .systemGray
    ]

    // MARK: - Outlets
    
    private lazy var imageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.tintColor = .white
        return imageView
    }()

    private lazy var backgroundIcon: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.backgroundIconCornerRadius
        return view
    }()


    // MARK: - Initializers

    init() {
        super.init(frame: .zero)
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
        addSubview(backgroundIcon)
        backgroundIcon.addSubview(imageIcon)
    }

    private func setupLayout() {
        imageIcon.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.width.equalTo(Constants.imageIconSize)
        }

        backgroundIcon.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.height.width.equalTo(Constants.backgroundIconSize)
        }
    }

    // MARK: - Configure

    func configureView(with setting: Setting) {
        switch setting.nameSetting {
        case "Bluetooth":
            imageIcon.image = UIImage(named: setting.nameIcon)
        default:
            imageIcon.image = UIImage(systemName: setting.nameIcon)
        }

        backgroundIcon.backgroundColor = listPossibleColors[setting.backgroundIcon] ?? UIColor()
    }
}

// MARK: - Constants

extension DetailView {
    private struct Constants {
        static let backgroundIconCornerRadius: CGFloat = 140
        static let backgroundIconSize: CGFloat = 280
        static let imageIconSize: CGFloat = 150
    }
}
