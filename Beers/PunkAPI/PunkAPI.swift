
import Foundation

enum PunkAPIResource: String {
    case beers
}

struct PunkAPI {
    static let baseURL: String = "https://api.punkapi.com"
    static let version: String = "v2"
}

class PunkAPIURLBuilder {
    private var url: String
    
    init(for resource: PunkAPIResource) {
        self.url = "\(PunkAPI.baseURL)/\(PunkAPI.version)/\(resource.rawValue)"
    }
    
    // MARK: - Public Methods
    
    func set(page: Int) -> PunkAPIURLBuilder {
        if page > 0 {
            self.joinParameterToUrl(parameter: "page=\(page)")
        }
        return self
    }
    
    func set(pagesTotal: Int) -> PunkAPIURLBuilder {
        if pagesTotal > 0 {
            self.joinParameterToUrl(parameter: "per_page=\(pagesTotal)")
        }
        return self
    }
    
    func set(food: String) -> PunkAPIURLBuilder {
        if !food.isEmpty {
            self.joinParameterToUrl(parameter: "food=\(food.percentEncoding)")
        }
        return self
    }
    
    private func joinParameterToUrl (parameter: String) {
        if (self.url.contains("?")){
            self.url += "&\(parameter)"
        } else {
            self.url += "?\(parameter)"
        }
    }
    
    func build() -> String {
        return url
    }
}
