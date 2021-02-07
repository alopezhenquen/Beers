

import Foundation

enum FetcherError: Error {
    case internalError
}

extension FetcherError : LocalizedError {
    var localizedDescription: String {
        switch self {
            case .internalError:
                return NSLocalizedString("FetcherInternalError", comment: "")
        }
    }
}

enum DataError : Error {
    case noBeersDataAvailable
}

extension DataError : LocalizedError {
    var localizedDescription: String {
        switch self {
            case .noBeersDataAvailable:
                return NSLocalizedString("NoBeersDataError", comment: "")
        }
    }
}
