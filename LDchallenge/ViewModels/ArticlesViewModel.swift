//
//  ArticlesViewModel.swift
//  LDchallenge
//
//  Created by Jerry Shi on 2020-09-28.
//  Copyright © 2020 jerryszp6116. All rights reserved.
//

import Foundation
import RxSwift

final class ArticlesViewModel {
    let title = Constants.ArticlesViewModel.title
    
    private let articlesService: ArticlesServiceProtocol
    
    init(articlesService: ArticlesServiceProtocol = ArticlesService()) {
        self.articlesService = articlesService
    }
    
    /**
     Map the article models into view models
    
     - Returns:
         -  [ArticleViewModel]: return the list of article view model
     */
    func fetchArticleViewModels() -> Observable<[ArticleViewModel]> {
        articlesService.fetchArticlesData().map {
            $0.map { ArticleViewModel(article: $0) }
        }
    }
}
