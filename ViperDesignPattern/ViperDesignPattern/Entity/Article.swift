//
//  Article.swift
//  ViperDesignPattern
//
//  Created by sarwesh reddy on 10/11/19.
//  Copyright © 2019 sarwesh reddy. All rights reserved.
//

import Foundation

// MARK: - Article
struct Article: Codable {
    let author, title, articleDescription: String
    let url: String
    let urlToImage: String
    let publishedAt: String

    enum CodingKeys: String, CodingKey {
        case author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt
    }
}

// MARK: Article convenience initializers and mutators

extension Article {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Article.self, from: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
}

