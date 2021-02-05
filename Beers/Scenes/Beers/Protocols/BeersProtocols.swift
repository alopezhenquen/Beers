

import Foundation

typealias FetchBeersResponse = (_ beers: [Beer]?, _ error: Error?) -> Void

//MARK: Implemented by View (Presenter -> View)
protocol PresenterToBeersViewProtocol: class {
    //MARK: Methods
    func onFetchCompleted(with beers: [Beer])
    func onNewFetchCompleted(with beers: [Beer])
    func showNoData()
    func showError(error: Error)
    func noMoreDataAvailable()
}

//MARK: Implemented by Presenter (View -> Presenter)
protocol ViewToBeersPresenterProtocol: class {
    //MARK: Methods
    func viewDidLoad()
    func fetchMoreBeers()
    func updateSearchField(with searchField: String)
    func didSelectedBeer(beer: Beer)
}

//MARK: Implemented by Presenter (Interactor -> Presenter)
protocol InteractorToBeersPresenterProtocol: class {
    //MARK: Methods
}

//MARK: Implemented by Interactor (Presenter -> Interactor)
protocol PresenterToBeersInteractorProtocol: class {
    //MARK: Methods
    func fetchBeers(page: Int,
                    pagesTotal: Int,
                    response: @escaping FetchBeersResponse)
    func fetchBeers(by food: String,
                    page: Int,
                    pagesTotal: Int,
                    response: @escaping FetchBeersResponse)
}

//MARK: Implemented by Router (Presenter -> Router)
protocol PresenterToBeersRouterProtocol: class {
    //MARK: Methods
    func routeToBeerDetails(with beer: Beer)
}
