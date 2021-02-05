
import Foundation

class Translation {
    
    func translate(from: BeerDTO) -> Beer {
        return Beer.init(id: from.id,
                         name: from.name,
                         tagline: from.tagline,
                         firstBrewed: from.firstBrewed,
                         description: from.description,
                         imageUrl: self.translate(from: from.imageUrl),
                         foodPairing: from.foodPairing,
                         brewersTips: from.brewersTips,
                         contributedBy: from.contributedBy)
    }
    
    fileprivate func translate(from: String?) -> URL? {
        guard let from = from, !from.isEmpty else { return nil }
        return URL.init(string: "\(from)")
    }
}
