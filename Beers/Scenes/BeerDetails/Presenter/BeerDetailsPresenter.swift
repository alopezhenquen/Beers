

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
        view?.showBeerDetails(with: beer)
    }
}

extension BeerDetailsPresenter: InteractorToBeerDetailsPresenterProtocol {}
