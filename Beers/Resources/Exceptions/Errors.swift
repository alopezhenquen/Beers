

import Foundation

enum FetcherError: Error {
    case `internal`
}

extension FetcherError : LocalizedError {
    var errorDescription: String? {
        switch self {
            case .internal:
                return NSLocalizedString("FetcherInternalError", comment: "")
        }
    }
}

enum DataError : Error {
    case noBeersDataAvailable
}

extension DataError : LocalizedError {
    var errorDescription: String? {
        switch self {
            case .noBeersDataAvailable:
                return NSLocalizedString("NoBeersDataError", comment: "")
        }
    }
}
