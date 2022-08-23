//
//  NetworkProtocol.swift
//  CryptoViper
//
//  Created by Mustafa Çiçek on 23.08.2022.
//

import Foundation

protocol NetworkProtocol {
    func get<T : Codable>(path: NetworkPath, _ paramaters: [String: String]?, onSuccess: @escaping (BaseResponse<T>) -> Void, onError:  BaseError)
}
