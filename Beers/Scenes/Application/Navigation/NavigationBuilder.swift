//
//  NavigationBuilder.swift
//  MarvelCharactersExample
//
//  Created by Kill3r on 14/1/21.
//

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
        // TODO Setup Navigation
        // navigationController.navigationBar.tintColor = UIColor.init(named: "default-tint-color")
        return navigationController
    }
}


