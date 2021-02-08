

import UIKit

class BeersRouter {
    
    //MARK: Properties
    var beerDetailsRouter: BeerDetailsRouter
    var beersViewController: BeersViewController
    var errorManager: ErrorManager
    
    //MARK: Methods
    init (beerDetailsRouter: BeerDetailsRouter,
          beersViewController: BeersViewController,
          errorManager: ErrorManager){
        self.beerDetailsRouter = beerDetailsRouter
        self.beersViewController = beersViewController
        self.errorManager = errorManager
    }
}

extension BeersRouter: PresenterToBeersRouterProtocol {
    
    //MARK: Methods
    func routeToBeerDetails(with beer: Beer){
        beerDetailsRouter.navigateToBeerDetails(from: beersViewController,
                                                with: beer)
    }
    
    func showError(with error: Error) {
        errorManager.showError(with: error)
    }
}
