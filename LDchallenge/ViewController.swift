//
//  ViewController.swift
//  LDchallenge
//
//  Created by Jerry Shi on 2020-09-28.
//  Copyright © 2020 jerryszp6116. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import JGProgressHUD

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    let disposeBag = DisposeBag()
    private var articlesViewModel: ArticlesViewModel?
    
    // MARK: - Lifecycle
    static func instantiate(viewModel: ArticlesViewModel) -> ViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.articlesViewModel = viewModel
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupViews()
    }
    
    // MARK: - Helpers
    func setupViews() {
        navigationItem.title = Constants.ArticlesViewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }


}

