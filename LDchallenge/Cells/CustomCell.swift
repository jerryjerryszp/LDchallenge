//
//  customCell.swift
//  LDchallenge
//
//  Created by Jerry Shi on 2020-09-28.
//  Copyright © 2020 jerryszp6116. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class CustomCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var subtitleLabel: UILabel!
    
    // MARK: - Properties
    var articleViewModel: ArticleViewModel?
    var disposeBag = DisposeBag()
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
}
