
import Foundation

struct MashTempDTO : Codable {
	let temp : TempDTO?
	let duration : Int?

	enum CodingKeys: String, CodingKey {
		case temp = "temp"
		case duration = "duration"
	}
}
