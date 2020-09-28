//
//  APIServices.swift
//  LDchallenge
//
//  Created by Jerry Shi on 2020-09-28.
//  Copyright © 2020 jerryszp6116. All rights reserved.
//

import Foundation
import RxSwift

protocol ArticlesServiceProtocol {
    func fetchArticlesData() -> Observable<[Article]>
}

class ArticlesService: ArticlesServiceProtocol {
    /**
     Fetch articles data
    
     - Returns:
         -  [Article]: return the list of articles
     */
    func fetchArticlesData() -> Observable<[Article]> {
        return Observable.create { observer -> Disposable in
            
            let url = URL(string: Constants.API.endpointUrl)!

            APIManager.shared.request(url: url, parameters: [:]) { (response, error) in

                if let data = response {
                    do {
                        let result = try JSONDecoder().decode(ArticlesResponse.self, from: data)
                        observer.onNext(result.data.children)
                    } catch {
                        observer.onError(error)
                    }
                }
            }

            return Disposables.create {}
        }
    }
}
