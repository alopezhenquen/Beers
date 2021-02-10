

import UIKit

class BeerDetailsBuilder {
    
    static func build (with beer: Beer, router: BeerDetailsRouter) -> UIViewController {
        
        // Dependecies
        let beersImagesRepo = BeersImagesFetcher.init()
        
        // VIPER
        let view = BeerDetailsViewController.init()
        let errorAlerts = DefaultErrorAlert.init(rootView: view)
        let interactor = BeerDetailsInteractor()
        let presenter = BeerDetailsPresenter(view: view,
                                             interactor: interactor,
                                             router: router,
                                             beer: beer)
        
        router.errorAlerts = errorAlerts
        interactor.presenter = presenter
        view.presenter = presenter
        view.beerImagesRepo = beersImagesRepo
        return view
    }
}
