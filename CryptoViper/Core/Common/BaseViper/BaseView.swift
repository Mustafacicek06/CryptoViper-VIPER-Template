//
//  BaseView.swift
//  CryptoViper
//
//  Created by MUSTACIC on 28.09.2023.
//

import Foundation


protocol BaseView {
    var presenter: BasePresenter? {get set}
    
    // cryptos update or error update
    func update(with cryptos : [CryptoModel])
    func update(with error: String)
}
