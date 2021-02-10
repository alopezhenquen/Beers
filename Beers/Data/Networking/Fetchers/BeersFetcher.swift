

import Foundation
import Alamofire

class BeersFetcher : BeersRepo {
    
    let decoder: DefaultDecoder<[BeerDTO]>
    let translation: Translation
    
    init(decoder: DefaultDecoder<[BeerDTO]>,
         translation: Translation) {
        self.decoder = decoder
        self.translation = translation
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
                response(nil, FetcherError.internal)
                return
            }
            let beersList = beers.map({
                self.translation.translate(from: $0)
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
                response(nil, FetcherError.internal)
                return
            }
            let beersList = beers.map({
                self.translation.translate(from: $0)
            })
            response(beersList, nil)
        } failure: { _error in
            response(nil, _error)
        }
    }
}
