//
//  Presenter.swift
//  ViperDesignPattern
//
//  Created by sarwesh reddy on 10/11/19.
//  Copyright © 2019 sarwesh reddy. All rights reserved.
//

import Foundation

class Presenter:InteractorToPresenterProtocol,ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?
    
    func updateView() {
        interactor?.fetchNews()
    }
    func newsFetched(news: Article) {
        view?.showNews(news: news)
    }
    func newsFetchFailed() {
        view?.showError()
    }
}
