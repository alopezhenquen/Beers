

import UIKit

class BeerDetailsRouter {
    //MARK: Properties
    var errorAlerts: ErrorAlert?
    
    //MARK: Methods
    func navigateToBeerDetails(from viewController: UIViewController,
                               with beer: Beer) {
        let view = BeerDetailsBuilder.build(with: beer,
                                            router: self)
        viewController.navigationController?.pushViewController(view, animated: true)
    }
}

extension BeerDetailsRouter: PresenterToBeerDetailsRouterProtocol {
    func showError(with error: Error) {
        errorAlerts?.showError(with: error)
    }
}
