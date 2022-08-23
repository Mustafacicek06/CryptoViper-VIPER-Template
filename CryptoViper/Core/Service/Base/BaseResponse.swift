//
//  BaseResponse.swift
//  CryptoViper
//
//  Created by Mustafa Çiçek on 23.08.2022.
//

import Foundation

struct BaseResponse<T : Codable> {
    var model: T?
    var message: String?
}
