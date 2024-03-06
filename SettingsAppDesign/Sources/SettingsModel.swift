import Foundation
import UIKit

enum SettingType {
    case switchSetting
    case statusSetting(statusText: String)
}

struct Setting {
    var nameIcon: String
    var backgroundIcon: String
    var nameSetting: String
    var type: SettingType?
}

extension Setting {
    static let settings: [[Setting]] = [
        [
            Setting(nameIcon: "airplane", backgroundIcon: "systemOrange", nameSetting: "Авиарежим", type: .switchSetting),
            Setting(nameIcon: "wifi", backgroundIcon: "systemBlue", nameSetting: "WiFi", type: .statusSetting(statusText: "Не подключено")),
            Setting(nameIcon: "BluethoosIcon", backgroundIcon: "systemBlue", nameSetting: "Bluetooth", type: .statusSetting(statusText: "Вкл.")),
            Setting(nameIcon: "antenna.radiowaves.left.and.right", backgroundIcon: "systemGreen", nameSetting: "Сотовая связь"),
            Setting(nameIcon: "personalhotspot", backgroundIcon: "systemGreen", nameSetting: "Режим модема"),
            Setting(nameIcon: "network", backgroundIcon: "systemBlue", nameSetting: "VPN", type: .switchSetting),
        ],
        [
            Setting(nameIcon: "app.badge", backgroundIcon: "systemRed", nameSetting: "Уведомления"),
            Setting(nameIcon: "speaker.wave.3.fill", backgroundIcon: "systemRed", nameSetting: "Звуки"),
            Setting(nameIcon: "moon.fill", backgroundIcon: "systemIndigo", nameSetting: "Не беспокоить"),
            Setting(nameIcon: "hourglass", backgroundIcon: "systemIndigo", nameSetting: "Экранное время"),
        ],
        [
            Setting(nameIcon: "gear", backgroundIcon: "systemGray", nameSetting: "Основные"),
            Setting(nameIcon: "switch.2", backgroundIcon: "systemGray", nameSetting: "Пункт управления"),
            Setting(nameIcon: "textformat.size", backgroundIcon: "systemBlue", nameSetting: "Экран и яркость"),
            Setting(nameIcon: "house", backgroundIcon: "systemBlue", nameSetting: "Экран Домой"),
            Setting(nameIcon: "accessibility", backgroundIcon: "systemBlue", nameSetting: "Универсальный доступ"),
            Setting(nameIcon: "hand.raised.fill", backgroundIcon: "systemBlue", nameSetting: "Конфиденциальность и безопасность"),
        ],
    ]
}
