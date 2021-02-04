//
//  BeersBuilder.swift
//  Beers
//
//  Created by Kill3r on 4/2/21.
//  
//

import UIKit

class BeersBuilder {

    static func build () -> UIViewController {
        let view = BeersViewController.init()
        let interactor = BeersInteractor()
        let router = BeersRouter()
        let presenter = BeersPresenter(view: view, interactor: interactor, router: router)
        interactor.presenter = presenter
        view.presenter = presenter
        return view
    }

    static func build (with navigationBuilder: NavigationBuilder) -> UINavigationController {
        let view = BeersViewController.init()
        let interactor = BeersInteractor()
        let router = BeersRouter()
        let presenter = BeersPresenter(view: view, interactor: interactor, router: router)
        interactor.presenter = presenter
        view.presenter = presenter
        return navigationBuilder.build(with: view)
    }
    
}
