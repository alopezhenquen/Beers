
import Foundation

class DefaultDecoder<T: Decodable> {
    internal let modelType: T.Type
    
    init(for type: T.Type) {
        self.modelType = type
    }
    
    func decode(from data: Data) -> T? {
        return try? JSONDecoder().decode(modelType.self, from: data)
    }
}
