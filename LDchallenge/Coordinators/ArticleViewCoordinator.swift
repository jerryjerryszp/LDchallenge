//
//  ArticleViewCoordinator.swift
//  LDchallenge
//
//  Created by Jerry Shi on 2020-09-28.
//  Copyright © 2020 jerryszp6116. All rights reserved.
//

import UIKit

class ArticleViewCoordinator: Coordinator {
    private let navigationController: UINavigationController
    private var articleViewController: ArticleViewController?
    private let articleViewModel: ArticleViewModel
    
    
    init(navigationController: UINavigationController, articleViewModel: ArticleViewModel) {
        self.navigationController = navigationController
        self.articleViewModel = articleViewModel
    }
    
    func start() {
        let articleViewController = ArticleViewController.instantiate(viewModel: articleViewModel)
        self.articleViewController = articleViewController
        navigationController.pushViewController(articleViewController, animated: true)
    }
}
