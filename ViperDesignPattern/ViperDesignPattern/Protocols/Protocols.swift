//
//  Protocols.swift
//  ViperDesignPattern
//
//  Created by sarwesh reddy on 09/11/19.
//  Copyright © 2019 sarwesh reddy. All rights reserved.
//

import Foundation
import UIKit
protocol ViewToPresenterProtocol {
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func updateView()
}
protocol PresenterToViewProtocol {
    func showNews(news:Article)
    func showError()
}
protocol PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol? {get set}
    func fetchNews()
}
protocol PresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
}

protocol InteractorToPresenterProtocol {
    func newsFetched(news: Article)
    func newsFetchFailed()
}
