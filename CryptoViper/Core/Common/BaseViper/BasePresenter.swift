//
//  BasePresenter.swift
//  CryptoViper
//
//  Created by MUSTACIC on 28.09.2023.
//

import Foundation

protocol BasePresenter {
    var router: BaseRouter? {get set}
    var interactor: BaseIntereactor? {get set}
    var view: BaseView? {get set}
    // view'a kendini güncellemesi gerektiğini belirtir
    // Result başarılı ve başarısız durumuna göre istediğin case'e göre durum döndürebilirsin
    func interactorDidDownloadCrypto (result: Result<[CryptoModel],Error>)
}
