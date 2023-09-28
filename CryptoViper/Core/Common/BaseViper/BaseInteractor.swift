//
//  BaseInteractor.swift
//  CryptoViper
//
//  Created by MUSTACIC on 28.09.2023.
//

import Foundation

protocol BaseInteractor {
    var presenter: BasePresenter? {get set}
    
    func downloadCryptos()
}
