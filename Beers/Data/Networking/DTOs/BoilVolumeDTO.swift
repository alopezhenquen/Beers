
import Foundation

struct BoilVolumeDTO : Codable {
	let value : Int?
	let unit : String?

	enum CodingKeys: String, CodingKey {
		case value = "value"
		case unit = "unit"
	}
}
