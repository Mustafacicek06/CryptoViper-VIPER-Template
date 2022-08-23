//
//  Presenter.swift
//  CryptoViper
//
//  Created by Mustafa Çiçek on 23.08.2022.
//

import Foundation


//Class, protocol
// talks to -> Interactor, Router, View

enum NetworkError: Error {
    case networkFailed
    case parsingFailed
}

protocol AnyPresenter {
    var router: AnyRouter? {get set}
    var interactor: AnyInteractor? {get set}
    var view: AnyView? {get set}
    // view'a kendini güncellemesi gerektiğini belirtir
    // Result başarılı ve başarısız durumuna göre istediğin case'e göre durum döndürebilirsin
    func interactorDidDownloadCrypto (result: Result<[CryptoModel],Error>)
}

class CryptoPresenter: AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCryptos()
        }
    }
    
    var view: AnyView?
    
    func interactorDidDownloadCrypto(result: Result<[CryptoModel], Error>) {
        switch result {
        case .success(let cryptos):
            view?.update(with: cryptos)
        case .failure(let error):
            view?.update(with: error.localizedDescription)
            
        }
    }
    

    
    
}
