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
        let decoder = DefaultDecoder.init(for: [BeerDTO].self)
        let translation = Translation.init()
        let beersRepo = BeersFetcher.init(decoder: decoder, translationManager: translation)
        let beersImagesRepo = BeersImagesFetcher.init()
        let view = BeersViewController.init()
        let interactor = BeersInteractor(beersRepo: beersRepo)
        let router = BeersRouter()
        let presenter = BeersPresenter(view: view, interactor: interactor, router: router)
        interactor.presenter = presenter
        view.presenter = presenter
        view.beerImagesRepo = beersImagesRepo
        return view
    }

    static func build (with navigationBuilder: NavigationBuilder) -> UINavigationController {
        return navigationBuilder.build(with: self.build())
    }
    
}
