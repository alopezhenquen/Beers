
import Foundation

struct MaltDTO : Codable {
	let name : String?
	let amount : AmountDTO?

	enum CodingKeys: String, CodingKey {
		case name = "name"
		case amount = "amount"
	}
}
