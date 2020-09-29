//
//  Article.swift
//  LDchallenge
//
//  Created by Jerry Shi on 2020-09-28.
//  Copyright © 2020 jerryszp6116. All rights reserved.
//

import Foundation

struct ArticlesResponse: Decodable {
    let kind: String
    let data: ArticlesData
}

struct ArticlesData: Decodable {
    let dist: Int
    let children: [Article]
}

struct Article: Decodable {
    let kind: String
    let data: ArticleData
}

struct ArticleData: Decodable {
    let title: String
    let selftext: String
    let created: Float?
    let thumbnail: String?
    let thumbnail_height: Int?
    let thumbnail_width: Int?
}
