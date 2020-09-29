//
//  ArticleViewModel.swift
//  LDchallenge
//
//  Created by Jerry Shi on 2020-09-28.
//  Copyright © 2020 jerryszp6116. All rights reserved.
//

import Foundation

struct ArticleViewModel {
    private let article: Article
    
    /// Title
    var articleTitleDisplayText: String {
        return article.data.title
    }
    
    /// Body
    var articleBodyDisplayText: String {
        return article.data.selftext
    }
    
    /// Thumbnail
    var thumbnailHeight: Int? {
        return article.data.thumbnail_height ?? 0
    }
    
    var thumbnailWidth: Int? {
        return article.data.thumbnail_width ?? 0
    }
    
    var thumbnailUrl: String? {
        if article.data.thumbnail != "self" {
            return article.data.thumbnail
        }
        
        return nil
    }
    
    /// Publish date
    var dateDisplayText: String {
        if let created = article.data.created,
            let date = Double(exactly: created) {
            let timeInterval = TimeInterval(date)
            let exactDate = Date(timeIntervalSince1970: timeInterval)
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.medium
            dateFormatter.dateStyle = DateFormatter.Style.medium
            dateFormatter.timeZone = .current
            return dateFormatter.string(from: exactDate)
        }
        
        return "Unknown Publish Date"
    }
    
    init(article: Article) {
        self.article = article
    }
}
