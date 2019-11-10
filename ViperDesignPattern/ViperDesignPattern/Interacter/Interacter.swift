//
//  Interacter.swift
//  ViperDesignPattern
//
//  Created by sarwesh reddy on 10/11/19.
//  Copyright © 2019 sarwesh reddy. All rights reserved.
//

import Foundation

class Interactor:PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?
    
    func fetchNews() {
        guard let url = URL(string: Constants.URL) else {
            presenter?.newsFetchFailed()
            return
        }
        do {
        let news = try NewsResponse(fromURL: url)
            if news.articles.count > 0 {
                presenter?.newsFetched(news: news.articles[0])
            }
        } catch  {
            presenter?.newsFetchFailed()
        }
    }
}
