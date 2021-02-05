

import UIKit

class BeerDetailsBuilder {
    
    static func build (with beer: Beer, router: BeerDetailsRouter) -> UIViewController {
        
        // Dependecies
        let beersImagesRepo = BeersImagesFetcher.init()
        
        // VIPER
        let view = BeerDetailsViewController.init()
        let interactor = BeerDetailsInteractor()
        let presenter = BeerDetailsPresenter(view: view,
                                             interactor: interactor,
                                             router: router,
                                             beer: beer)
        interactor.presenter = presenter
        view.presenter = presenter
        view.beerImagesRepo = beersImagesRepo
        return view
    }
}
