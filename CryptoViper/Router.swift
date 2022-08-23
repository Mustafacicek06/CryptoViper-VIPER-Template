//
//  Router.swift
//  CryptoViper
//
//  Created by Mustafa Çiçek on 23.08.2022.
//

import Foundation
import UIKit

// app start which view ? entry point
// class, protocol

// all entry point after that
typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry : EntryPoint? {get}
    static func startExecution() -> AnyRouter
}

class CryptoRouter: AnyRouter {
    var entry: EntryPoint?
    
    
    // all app linked with each other
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
        
        var view : AnyView = CryptoViewController()
        var presenter : AnyPresenter = CryptoPresenter()
        var interector : AnyInteractor = CryptoInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interector
        
        interector.presenter = presenter
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
    
}
