//
//  Router.swift
//  ViperDesignPattern
//
//  Created by sarwesh reddy on 10/11/19.
//  Copyright © 2019 sarwesh reddy. All rights reserved.
//

import Foundation
import UIKit
class Router:PresenterToRouterProtocol {
    class func createModule() -> UIViewController {
        let vc = mainStoryboard.instantiateViewController(identifier: "ViewController") as! ViewController
        var presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = Presenter()
        var interactor: PresenterToInteractorProtocol = Interactor()
                  let router: PresenterToRouterProtocol = Router()
                  
            vc.presenter = presenter
                  presenter.view = vc
                  presenter.router = router
                  presenter.interactor = interactor
                  interactor.presenter = presenter
                          return vc
    }
    
    
       static var mainStoryboard: UIStoryboard{
           return UIStoryboard(name:"Main",bundle: Bundle.main)
       }}
