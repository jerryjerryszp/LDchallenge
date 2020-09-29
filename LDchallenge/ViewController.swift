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
import Kingfisher

protocol ViewControllerDelegate: class {
    func didSelectArticle(_ viewController: ViewController, didSelect article: ArticleViewModel)
}

class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    let disposeBag = DisposeBag()
    private var articlesViewModel: ArticlesViewModel?
    weak var delegate: ViewControllerDelegate?
    
    // MARK: - Lifecycle
    static func instantiate(viewModel: ArticlesViewModel) -> ViewController {
        let storyboard = UIStoryboard(name: Constants.Storyboard.name, bundle: .main)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        viewController.articlesViewModel = viewModel
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupViews()
        showArticles()
        observeSelection()
        
    }
    
    // MARK: - Helpers
    func setupViews() {
        navigationItem.title = Constants.ArticlesViewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(UINib(nibName: String(describing: CustomCell.self), bundle: nil),
                                      forCellReuseIdentifier: String(describing: CustomCell.self))
        tableView.tableFooterView = UIView()
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.allowsSelection = true
        tableView.separatorStyle = .singleLine
    }
    
    func showArticles() {
        articlesViewModel?.fetchArticleViewModels()
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(
                cellIdentifier: Constants.CustomCell.reuseIdentifier,
                cellType: CustomCell.self
            )) { row, viewModel, cell in
                cell.titleLabel.text = viewModel.articleTitleDisplayText
                cell.subtitleLabel.text = viewModel.dateDisplayText
                
                if let thumbnailUrl = viewModel.thumbnailUrl {
                    guard let imageUrl = URL(string: thumbnailUrl) else {
                        return
                    }
                    
                    cell.thumbnailImageView.kf.setImage(with: imageUrl)
                    cell.thumbnailImageViewWidthConstraint.constant = cell.titleLabel.frame.width
                    if let thumbnailWidth = viewModel.thumbnailWidth,
                        let thumbnailHeight = viewModel.thumbnailHeight {
                        let width = cell.titleLabel.frame.width
                        let sizeMultiplier = width / CGFloat(thumbnailWidth)
                        cell.thumbnailImageViewHeightConstraint.constant = CGFloat(thumbnailHeight) * sizeMultiplier
                    }
                }
        }.disposed(by: disposeBag)
        
    }
    
    func observeSelection() {
        tableView
            .rx
            .modelSelected(ArticleViewModel.self)
            .subscribe(onNext: { [weak self] (selectedArticle) in
                guard let strongSelf = self else {
                    return
                }
                
                strongSelf.tableView.deselectSelectedRow(animated: true)
                strongSelf.delegate?.didSelectArticle(strongSelf, didSelect: selectedArticle)
                
                print(selectedArticle.articleTitleDisplayText)
                
            }).disposed(by: disposeBag)
    }

}

extension UITableView {
    func deselectSelectedRow(animated: Bool) {
        if let indexPathForSelectedRow = self.indexPathForSelectedRow {
            self.deselectRow(at: indexPathForSelectedRow, animated: animated)
        }
    }
}
