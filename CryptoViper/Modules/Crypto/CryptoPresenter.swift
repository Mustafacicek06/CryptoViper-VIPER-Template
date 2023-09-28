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


class CryptoPresenter: BasePresenter {
    var router: BaseRouter?
    
    var interactor: BaseInteractor? {
        didSet {
            interactor?.downloadCryptos()
        }
    }
    
    var view: BaseView?
    
    func interactorDidDownloadCrypto(result: Result<[CryptoModel], Error>) {
        switch result {
        case .success(let cryptos):
            view?.update(with: cryptos)
        case .failure(let error):
            view?.update(with: error.localizedDescription)
            
        }
    }
    

    
    
}
