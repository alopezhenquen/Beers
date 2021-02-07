

import Foundation
import SwiftLog

class BeersPresenter {
    //MARK: Properties
    weak var view: PresenterToBeersViewProtocol?
    var interactor: PresenterToBeersInteractorProtocol?
    var router: PresenterToBeersRouterProtocol?
    
    var presentedBeersByFood = ""
    var presentedBeersPage = 0
    let presentedBeersPageTotal = 20
    var searchField = ""
    var noMoreData = false

    //MARK: Methods
    init(view: PresenterToBeersViewProtocol,
         interactor: PresenterToBeersInteractorProtocol,
         router: PresenterToBeersRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func fetchBeers() {
        // Ask Interactor for Beers.
        presentedBeersPage += 1
        interactor?.fetchBeers(page: presentedBeersPage,
                               pagesTotal: presentedBeersPageTotal,
                               response: { (beers, error) in
                                    guard let error = error else {
                                        guard let beers = beers else {
                                            self.presentedBeersPage -= 1
                                            let _error = DataError.noBeersDataAvailable
                                            self.view?.showNoData()
                                            self.router?.showError(with: _error)
                                            logw("\(_error.localizedDescription)")
                                            return
                                        }
                                        if beers.isEmpty {
                                            if self.presentedBeersPage == 1 {
                                                self.view?.showNoData()
                                            } else {
                                                self.noMoreData = true
                                                self.view?.noMoreDataAvailable()
                                            }
                                        } else {
                                            if beers.count < self.presentedBeersPageTotal {
                                                self.noMoreData = true
                                            }
                                            self.view?.onFetchCompleted(with: beers)
                                        }
                                        return
                                    }
                                    self.presentedBeersPage -= 1
                                    self.view?.showNoData()
                                    self.router?.showError(with: DataError.noBeersDataAvailable)
                                    logw("\(error.localizedDescription)")
                               })
    }
    
    func fetchBeers(by food: String) {
        // Ask Interactor for Beers by Food parameter.
        presentedBeersPage += 1
        interactor?.fetchBeers(by: food,
                               page: presentedBeersPage,
                               pagesTotal: presentedBeersPageTotal,
                               response: { (beers, error) in
                                    guard let error = error else {
                                        guard let beers = beers else {
                                            self.presentedBeersPage -= 1
                                            let _error = DataError.noBeersDataAvailable
                                            self.view?.showNoData()
                                            self.router?.showError(with: _error)
                                            logw("\(_error.localizedDescription)")
                                            return
                                        }
                                        if beers.isEmpty {
                                            if self.presentedBeersPage == 1 {
                                                self.view?.showNoData()
                                            } else {
                                                self.noMoreData = true
                                                self.view?.noMoreDataAvailable()
                                            }
                                        } else {
                                            if beers.count < self.presentedBeersPageTotal {
                                                self.noMoreData = true
                                            }
                                            if self.presentedBeersByFood == food {
                                                self.view?.onFetchCompleted(with: beers)
                                            } else {
                                                self.presentedBeersByFood = food
                                                self.view?.onNewFetchCompleted(with: beers)
                                            }
                                        }
                                        return
                                    }
                                    self.presentedBeersPage -= 1
                                    self.view?.showNoData()
                                    self.router?.showError(with: DataError.noBeersDataAvailable)
                                    logw("\(error.localizedDescription)")
                               })
    }
}

extension BeersPresenter: ViewToBeersPresenterProtocol {
    
    //MARK: Methods
    func viewDidLoad() {
        fetchBeers()
    }
    
    func reloadData() {
        self.presentedBeersPage = 0
        self.noMoreData = false
        if searchField.isEmpty {
            fetchBeers()
        } else {
            fetchBeers(by: searchField)
        }
    }
    
    func fetchMoreBeers() {
        if noMoreData {
            view?.noMoreDataAvailable()
        } else {
            if searchField.isEmpty {
                fetchBeers()
            } else {
                fetchBeers(by: searchField)
            }
        }
    }
    
    func updateSearchField(with searchField: String) {
        self.searchField = searchField.replacingOccurrences(of: " ", with: "_")
        self.noMoreData = false
        self.presentedBeersPage = 0
        fetchMoreBeers()
    }
    
    func didSelectedBeer(beer: Beer) {
        router?.routeToBeerDetails(with: beer)
    }
}

extension BeersPresenter: InteractorToBeersPresenterProtocol {
    //MARK: Methods
}
