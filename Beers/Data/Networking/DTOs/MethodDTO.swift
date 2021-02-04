

import Foundation
struct MethodDTO : Codable {
	let mashTemp : [MashTempDTO]?
	let fermentation : FermentationDTO?
	let twist : String?

	enum CodingKeys: String, CodingKey {
		case mashTemp = "mash_temp"
		case fermentation = "fermentation"
		case twist = "twist"
	}
}
