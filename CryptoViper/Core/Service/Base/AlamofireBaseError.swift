//
//  BaseError.swift
//  CryptoViper
//
//  Created by Mustafa Çiçek on 23.08.2022.
//

import Foundation
import Alamofire

class BaseError {
    var errorMessage: String?
    var statusCode: Int?
    var debugMessage: String?
    
    init(_ afError : AFError?){
        debugMessage = afError.debugDescription
        statusCode = afError?.responseCode
        errorMessage = afError?.errorDescription
    }
}
