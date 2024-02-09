import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let settingsScreenViewController = SettingsScreenViewController()
        let navigationController = UINavigationController(rootViewController: settingsScreenViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
