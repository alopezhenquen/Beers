//
//  BeerDetailsPresenter.swift
//  Beers
//
//  Created by Kill3r on 5/2/21.
//  
//

import Foundation

class BeerDetailsPresenter {
    //MARK: Properties
    weak var view: PresenterToBeerDetailsViewProtocol?
    var interactor: PresenterToBeerDetailsInteractorProtocol?
    var router: PresenterToBeerDetailsRouterProtocol?
    var beer: Beer

    //MARK: Methods
    init(view: PresenterToBeerDetailsViewProtocol,
         interactor: PresenterToBeerDetailsInteractorProtocol,
         router: PresenterToBeerDetailsRouterProtocol,
         beer: Beer) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.beer = beer
    }
}

extension BeerDetailsPresenter: ViewToBeerDetailsPresenterProtocol {
    //MARK: Methods
    func viewWillAppear() {
        view?.showBeerDetails(beer: beer, isFavorite: false)
    }
}

extension BeerDetailsPresenter: InteractorToBeerDetailsPresenterProtocol {
    //MARK: Methods
}
