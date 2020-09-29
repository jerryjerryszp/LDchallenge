//
//  SceneDelegate.swift
//  LDchallenge
//
//  Created by Jerry Shi on 2020-09-28.
//  Copyright © 2020 jerryszp6116. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else {
            return
        }
        
        let window = UIWindow(windowScene: scene)
        
        let appCordinator = AppCoordinator(window: window, articles: ArticlesViewModel())
        self.window = window
        self.appCoordinator = appCordinator
        
        appCordinator.start()
    }

}

