//
//  String+Extensions.swift
//  MarvelCharactersExample
//
//  Created by Kill3r on 14/1/21.
//

import Foundation
import CryptoKit

extension String {
    var percentEncoding: String {
        self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? self
    }
    
    var md5: String {
        let digest = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
}
