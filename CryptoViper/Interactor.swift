//
//  Interactor.swift
//  CryptoViper
//
//  Created by Mustafa Çiçek on 23.08.2022.
//

import Foundation

//Class, Protocol
//talks to -> presenter
//


protocol AnyInteractor {
    var presenter: AnyPresenter? {get set}
    
    func downloadCryptos()
}

class CryptoInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func downloadCryptos() {
        let myApiKey = "ae00a59a93623c9005482d4d573310e67e4b1434"
        let baseUrl =  URL(string: "https://api.nomics.com/v1/currencies/ticker?key=\(myApiKey)")
        
        guard let baseUrl = baseUrl else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: baseUrl) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.networkFailed))
                return
            }
            do {
                let cryptos = try JSONDecoder().decode([CryptoModel].self, from: data)
                self?.presenter?.interactorDidDownloadCrypto(result: .success(cryptos))
                
            } catch {
                self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.parsingFailed))
            }
            
        }
        
        task.resume()

    }
}
