//
//  NewsResponse.swift
//  ViperDesignPattern
//
//  Created by sarwesh reddy on 10/11/19.
//  Copyright © 2019 sarwesh reddy. All rights reserved.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let status, source, sortBy: String
    let articles: [Article]
}

// MARK: NewsResponse convenience initializers and mutators

extension NewsResponse {
    init(data: Data) throws {
        self = try JSONDecoder().decode(NewsResponse.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

}


