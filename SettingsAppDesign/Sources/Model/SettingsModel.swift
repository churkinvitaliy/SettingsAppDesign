import Foundation

final class SettingsModel {
    private var settings: [[Setting]] = []

    init() {
        self.settings = Setting.settings
    }

    func getSettings() -> [[Setting]] {
        return settings
    }
}
