

import UIKit

protocol NavigationBuilder {
    func build(with rootViewController: UIViewController) -> UINavigationController
}

class DefaultNavigationBuilder: NavigationBuilder {
    
    func build(with rootViewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        return setupNavigationView(navigationController: navigationController)
    }
    
    func setupNavigationView (navigationController: UINavigationController) -> UINavigationController {
        navigationController.navigationBar.tintColor = UIColor.init(named: "navigationBar.tintColor")
        return navigationController
    }
}


