
import Foundation

typealias GetBeersResponse = (_ beers: [Beer]?, _ error: Error?) -> Void

protocol BeersRepo {
    func getBeers(page: Int,
                  pagesTotal: Int,
                  response: @escaping GetBeersResponse)
    func getBeers(by food: String,
                  page: Int,
                  pagesTotal: Int,
                  response: @escaping GetBeersResponse)
}
