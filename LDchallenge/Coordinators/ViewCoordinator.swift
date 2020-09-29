//
//  ViewCoordinator.swift
//  LDchallenge
//
//  Created by Jerry Shi on 2020-09-28.
//  Copyright © 2020 jerryszp6116. All rights reserved.
//

import UIKit

class ViewCoordinator: Coordinator {
    
    private var navigationController: UINavigationController
    private var articleViewCoordinator: ArticleViewCoordinator?
    private var viewController: ViewController?
    private var articlesViewModel: ArticlesViewModel
    
    init(navigationController: UINavigationController, articles: ArticlesViewModel) {
        self.navigationController = navigationController
        self.articlesViewModel = articles
    }
    
    func start() {
        let viewController = ViewController.instantiate(viewModel: ArticlesViewModel())
        viewController.delegate = self
        
        self.viewController = viewController
        navigationController.pushViewController(viewController, animated: true)
    }
    
}

extension ViewCoordinator: ViewControllerDelegate {
    func didSelectArticle(_ viewController: ViewController, didSelect article: ArticleViewModel) {
        let articleViewCoordinator = ArticleViewCoordinator(navigationController: navigationController, articleViewModel: article)
        self.articleViewCoordinator = articleViewCoordinator
        articleViewCoordinator.start()
    }
}
