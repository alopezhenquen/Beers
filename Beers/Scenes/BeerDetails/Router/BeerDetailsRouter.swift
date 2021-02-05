//
//  BeerDetailsRouter.swift
//  Beers
//
//  Created by Kill3r on 5/2/21.
//  
//

import UIKit

class BeerDetailsRouter {
    
    //MARK: Methods
    
    func navigateToBeerDetailsFrom(viewController: UIViewController, beer: Beer) {
        let view = BeerDetailsBuilder.build(with: beer, router: self)
        viewController.navigationController?.pushViewController(view, animated: true)
    }
}

extension BeerDetailsRouter: PresenterToBeerDetailsRouterProtocol {
    //MARK: Methods
}
