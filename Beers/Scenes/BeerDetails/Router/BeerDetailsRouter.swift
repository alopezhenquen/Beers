

import UIKit

class BeerDetailsRouter {
    
    //MARK: Methods
    func navigateToBeerDetails(from viewController: UIViewController, with beer: Beer) {
        let view = BeerDetailsBuilder.build(with: beer,
                                            router: self)
        viewController.navigationController?.pushViewController(view, animated: true)
    }
}

extension BeerDetailsRouter: PresenterToBeerDetailsRouterProtocol {}
