
import Foundation

struct Beer {
    let id: Int?
    let name: String?
    let tagline: String?
    let firstBrewed: String?
    let description: String?
    let imageUrl: URL?
    let foodPairing: [String]?
    let brewersTips: String?
    let contributedBy: String?
    
    init(id: Int?,
         name: String?,
         tagline: String?,
         firstBrewed: String?,
         description: String?,
         imageUrl: URL?,
         foodPairing: [String]?,
         brewersTips: String?,
         contributedBy: String?) {
        self.id = id
        self.name = name
        self.tagline = tagline
        self.firstBrewed = firstBrewed
        self.description = description
        self.imageUrl = imageUrl
        self.foodPairing = foodPairing
        self.brewersTips = brewersTips
        self.contributedBy = contributedBy
    }
    
}
