

import UIKit

class BeersRouter {
    //MARK: Properties
    var beerDetailsRouter: BeerDetailsRouter
    var beersViewController: BeersViewController
    
    //MARK: Methods
    init (beerDetailsRouter: BeerDetailsRouter,
          beersViewController: BeersViewController){
        self.beerDetailsRouter = beerDetailsRouter
        self.beersViewController = beersViewController
    }
}

extension BeersRouter: PresenterToBeersRouterProtocol {
    //MARK: Methods
    func routeToBeerDetails(with beer: Beer){
        beerDetailsRouter.navigateToBeerDetails(from: beersViewController,
                                                with: beer)
    }
}
