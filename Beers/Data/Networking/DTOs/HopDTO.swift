
import Foundation

struct HopDTO : Codable {
	let name : String?
	let amount : AmountDTO?
	let add : String?
	let attribute : String?

	enum CodingKeys: String, CodingKey {
		case name = "name"
		case amount = "amount"
		case add = "add"
		case attribute = "attribute"
	}
}
