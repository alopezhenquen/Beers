

import Foundation

extension String {
    var percentEncoding: String {
        self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self
    }
}
