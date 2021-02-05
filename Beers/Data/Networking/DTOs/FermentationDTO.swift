
import Foundation

struct FermentationDTO : Codable {
	let temp : TempDTO?

	enum CodingKeys: String, CodingKey {
		case temp = "temp"
	}
}
