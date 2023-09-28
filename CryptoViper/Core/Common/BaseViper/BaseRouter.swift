//
//  BaseRouter.swift
//  CryptoViper
//
//  Created by MUSTACIC on 28.09.2023.
//

import UIKit

typealias EntryPoint = BaseView & UIViewController

protocol BaseRouter {
    var entry : EntryPoint? {get}
    static func startExecution() -> BaseRouter
}
