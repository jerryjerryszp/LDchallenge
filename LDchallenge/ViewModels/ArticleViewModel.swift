//
//  ArticleViewModel.swift
//  LDchallenge
//
//  Created by Jerry Shi on 2020-09-28.
//  Copyright © 2020 jerryszp6116. All rights reserved.
//

import Foundation

struct ArticleViewModel {
    private let article: Article
    
    var articleTitleDisplayText: String {
        return article.data.title
    }
    
    init(article: Article) {
        self.article = article
    }
}
