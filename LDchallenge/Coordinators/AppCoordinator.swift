//
//  AppCoordinator.swift
//  LDchallenge
//
//  Created by Jerry Shi on 2020-09-28.
//  Copyright © 2020 jerryszp6116. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    private var window: UIWindow
    private let rootViewController: UINavigationController
    private var viewCoordinator: ViewCoordinator?
    
    init(window: UIWindow, articles: ArticlesViewModel) {
        self.window = window
        rootViewController = UINavigationController()
        
        viewCoordinator = ViewCoordinator(navigationController: rootViewController, articles: articles)
    }
    
    func start() {
        window.rootViewController = rootViewController
        viewCoordinator?.start()
        window.makeKeyAndVisible()
    }
}
