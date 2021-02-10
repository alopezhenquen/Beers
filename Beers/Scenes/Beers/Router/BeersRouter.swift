

import UIKit

class BeersRouter {
    
    //MARK: Properties
    var beerDetailsRouter: BeerDetailsRouter
    var beersViewController: BeersViewController
    var errorAlerts: ErrorAlert
    
    //MARK: Methods
    init (beerDetailsRouter: BeerDetailsRouter,
          beersViewController: BeersViewController,
          errorAlerts: ErrorAlert){
        self.beerDetailsRouter = beerDetailsRouter
        self.beersViewController = beersViewController
        self.errorAlerts = errorAlerts
    }
}

extension BeersRouter: PresenterToBeersRouterProtocol {
    
    //MARK: Methods
    func routeToBeerDetails(with beer: Beer){
        beerDetailsRouter.navigateToBeerDetails(from: beersViewController,
                                                with: beer)
    }
    
    func showError(with error: Error) {
        errorAlerts.showError(with: error)
    }
}
