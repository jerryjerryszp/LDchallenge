//
//  ArticleViewController.swift
//  LDchallenge
//
//  Created by Jerry Shi on 2020-09-28.
//  Copyright © 2020 jerryszp6116. All rights reserved.
//

import Foundation
import UIKit

class ArticleViewController: UIViewController {
    // MARK: - IBOutlets
    
    @IBOutlet weak var thumbnailImageViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var thumbnailImageViewWidthConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    var articleViewModel: ArticleViewModel?
    
    // MARK: - Lifecycle
    static func instantiate(viewModel: ArticleViewModel) -> ArticleViewController {
        let storyboard = UIStoryboard(name: Constants.Storyboard.name, bundle: .main)
        let articleViewController = storyboard.instantiateViewController(identifier: "ArticleViewController") as! ArticleViewController
        articleViewController.articleViewModel = viewModel
        return articleViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = articleViewModel?.articleTitleDisplayText
        subtitleLabel.text = articleViewModel?.dateDisplayText
        
        if let thumbnailUrl = articleViewModel?.thumbnailUrl {
            guard let imageUrl = URL(string: thumbnailUrl) else {
                return
            }
            
            thumbnailImageView.kf.setImage(with: imageUrl)
            thumbnailImageViewWidthConstraint.constant = titleLabel.frame.width

            if let thumbnailWidth = articleViewModel?.thumbnailWidth,
                let thumbnailHeight = articleViewModel?.thumbnailHeight {
                let width = titleLabel.frame.width
                let sizeMultiplier = width / CGFloat(thumbnailWidth)
                thumbnailImageViewHeightConstraint.constant = CGFloat(thumbnailHeight) * sizeMultiplier
            }
        }
        
        bodyLabel.text = articleViewModel?.articleBodyDisplayText
    }
}
