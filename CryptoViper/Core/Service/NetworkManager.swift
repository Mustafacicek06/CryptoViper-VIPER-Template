//
//  NetworkManager.swift
//  CryptoViper
//
//  Created by Mustafa Çiçek on 23.08.2022.
//

import Foundation


import Foundation
import Alamofire


typealias Success<T : Codable> = (BaseResponse<T>) -> Void



class NetworkManager: NetworkProtocol {
    private var baseUrl: String

    init(config: NetworkConfig) {
        self.baseUrl = config.baseUrl
    }

    func get<T: Codable>(
        path: NetworkPath,
        _ paramaters: [String: String]?,
        onSuccess: @escaping Success<T>,
        onError:  BaseError
    ) {
        AF.request(networkRequestUrl(path),
            method: .get,
            parameters: paramaters
        ).validate().responseDecodable(of: T.self)
        { (response) in
            guard let model = response.value else {
                BaseError(response.error)
                return
            }
            onSuccess(BaseResponse.init(model: model, message: ""))
        }
    }

}

extension NetworkManager {
    func networkRequestUrl(_ path: NetworkPath) -> String {
        return baseUrl
    }
}
