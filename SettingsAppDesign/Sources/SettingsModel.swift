import Foundation

struct Setting {
    var nameIcon: String
    var backgroundIcon: String
    var nameSetting: String
    var hasSwitch: Bool = false
    var hasStatus: Bool = false
}

extension Setting {
    static let settings: [[Setting]] = [
        [
            Setting(nameIcon: "airplane", backgroundIcon: "systemOrange", nameSetting: "Авиарежим", hasSwitch: true),
            Setting(nameIcon: "wifi", backgroundIcon: "systemBlue", nameSetting: "WiFi", hasStatus: true),
            Setting(nameIcon: "BluethoosIcon", backgroundIcon: "systemBlue", nameSetting: "Bluetooth", hasStatus: true),
            Setting(nameIcon: "antenna.radiowaves.left.and.right", backgroundIcon: "systemGreen", nameSetting: "Сотовая связь"),
            Setting(nameIcon: "personalhotspot", backgroundIcon: "systemGreen", nameSetting: "Режим модема"),
            Setting(nameIcon: "network", backgroundIcon: "systemBlue", nameSetting: "VPN", hasSwitch: true),
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
