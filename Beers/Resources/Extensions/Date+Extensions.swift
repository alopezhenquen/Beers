//
//  Date+Extensions.swift
//  MarvelCharactersExample
//
//  Created by Kill3r on 14/1/21.
//

import Foundation
extension Date {
    func toMilliseconds() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    func toMillisecondsString() -> String {
        return String(self.toMilliseconds())
    }
}
