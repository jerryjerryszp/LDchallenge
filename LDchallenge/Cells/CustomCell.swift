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
import Kingfisher

class CustomCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet var thumbnailImageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var thumbnailImageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var subtitleLabel: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.kf.cancelDownloadTask()
        thumbnailImageView.kf.setImage(with: URL(string: ""))
        thumbnailImageView.image = nil
        thumbnailImageViewHeightConstraint.constant = 0.0
        titleLabel.text = ""
        subtitleLabel.text = ""
    }
}
