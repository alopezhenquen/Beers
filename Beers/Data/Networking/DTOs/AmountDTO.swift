

import Foundation
struct AmountDTO : Codable {
	let value : Double?
	let unit : String?

	enum CodingKeys: String, CodingKey {
		case value = "value"
		case unit = "unit"
	}
}
