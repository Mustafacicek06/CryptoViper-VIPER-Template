//
//  NetworkConfig.swift
//  CryptoViper
//
//  Created by Mustafa Çiçek on 23.08.2022.
//

import Foundation


class NetworkConfig {
    var baseUrl: String
    var headers: [String: String]?
    
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
}
