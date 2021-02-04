

import Foundation

class BeersInteractor: PresenterToBeersInteractorProtocol {

    // MARK: Properties
    weak var presenter: InteractorToBeersPresenterProtocol?
    fileprivate var beersRepo: BeersRepo
    
    //MARK: Methods
    init(beersRepo: BeersRepo) {
        self.beersRepo = beersRepo
    }

    //MARK: Methods
    func fetchBeers(page: Int, pagesTotal: Int, response: @escaping FetchBeersResponse) {
        beersRepo.getBeers(page: page,
                           pagesTotal: pagesTotal) { (beers, error) in
            response(beers, error)
        }
    }
    
    func fetchBeers(by food: String, page: Int, pagesTotal: Int, response: @escaping FetchBeersResponse) {
        beersRepo.getBeers(by: food,
                           page: page,
                           pagesTotal: pagesTotal) { (beers, error) in
            response(beers, error)
        }
    }
}
