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
        showArticles()
    }
    
    // MARK: - Helpers
    func setupViews() {
        navigationItem.title = Constants.ArticlesViewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UINib(nibName: String(describing: CustomCell.self), bundle: nil),
                                      forCellReuseIdentifier: String(describing: CustomCell.self))
        tableView.tableFooterView = UIView()
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
    }
    
    func showArticles() {
        articlesViewModel?.fetchArticleViewModels()
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(
                cellIdentifier: "CustomCell",
                cellType: CustomCell.self
            )) { row, viewModel, cell in
                cell.titleLabel.text = viewModel.articleTitleDisplayText
                
        }.disposed(by: disposeBag)
    }


}

