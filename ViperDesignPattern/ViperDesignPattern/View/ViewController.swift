//
//  ViewController.swift
//  ViperDesignPattern
//
//  Created by sarwesh reddy on 09/11/19.
//  Copyright © 2019 sarwesh reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var presenter: ViewToPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        addFetchNewsButton()
    }
    func addFetchNewsButton(){
        let fetchNews = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(fetchNewsClicked(_:)))
        self.navigationItem.rightBarButtonItem = fetchNews
    }
    @objc func fetchNewsClicked(_ sender: UIBarButtonItem) {
        presenter?.updateView()
    }
}
extension ViewController : PresenterToViewProtocol {
    func showNews(news: Article) {
        let alert = UIAlertController(title: news.title, message: news.articleDescription, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
   
    
    func showError() {
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching News", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
    
    
}
