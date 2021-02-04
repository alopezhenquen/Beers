

import Foundation
struct IngredientsDTO : Codable {
	let malt : [MaltDTO]?
	let hops : [HopDTO]?
	let yeast : String?

	enum CodingKeys: String, CodingKey {
		case malt = "malt"
		case hops = "hops"
		case yeast = "yeast"
	}
}
