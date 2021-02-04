//
//  URL+Extensions.swift
//  MarvelCharactersExample
//
//  Created by Kill3r on 16/1/21.
//

import Foundation

extension URL {
    static func inDocumentsFolder(fileName: String) -> URL {
        return URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0], isDirectory: true)
            .appendingPathComponent(fileName)
    }
}
