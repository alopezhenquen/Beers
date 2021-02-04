

import Foundation
import Alamofire

class BeersFetcher : BeersRepo {
    
    let decoder: DefaultDecoder<[BeerDTO]>
    let translationManager: Translation
    
    init(decoder: DefaultDecoder<[BeerDTO]>,
         translationManager: Translation) {
        self.decoder = decoder
        self.translationManager = translationManager
    }
    
    func getBeers(page: Int, pagesTotal: Int, response: @escaping GetBeersResponse) {
        let url = PunkAPIURLBuilder.init(for: .beers)
                    .set(page: page)
                    .set(pagesTotal: pagesTotal)
                    .build()
        
        let requestData = RequestData.init(url: url,
                                           method: .get,
                                           encoding: JSONEncoding.default,
                                           parameters: nil)
        
        AlamofireManager.request(data: requestData,
                                 decoder: decoder) { [self] _response in
            guard let beers = _response else {
                response(nil, nil) // TODO
                return
            }
//            guard let beers = responseData.beers else {
//                response(nil, nil) // TODO
//                return
//            }
            let beersList = beers.map({
                self.translationManager.translate(from: $0)
            })
            response(beersList, nil)
        } failure: { _error in
            response(nil, _error)
        }
    }
    
    func getBeers(by food: String, page: Int, pagesTotal: Int, response: @escaping GetBeersResponse) {
        let url = PunkAPIURLBuilder.init(for: .beers)
                    .set(food: food)
                    .set(page: page)
                    .set(pagesTotal: pagesTotal)
                    .build()
        
        let requestData = RequestData.init(url: url,
                                           method: .get,
                                           encoding: JSONEncoding.default,
                                           parameters: nil)
        
        AlamofireManager.request(data: requestData,
                                 decoder: decoder) { [self] _response in
            guard let beers = _response else {
                response(nil, nil) // TODO
                return
            }
//            guard let beers = responseData.beers else {
//                response(nil, nil) // TODO
//                return
//            }
            let beersList = beers.map({
                self.translationManager.translate(from: $0)
            })
            response(beersList, nil)
        } failure: { _error in
            response(nil, _error)
        }
    }
}
