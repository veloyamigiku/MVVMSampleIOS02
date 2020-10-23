//
//  HttpGet.swift
//  MVVMSampleIOS02
//
//  Created by velo.yamigiku on 2020/10/23.
//  Copyright © 2020 velo.yamigiku. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

class HttpGet {
    
    private var getDataRelay: PublishRelay<Data>
    
    init() {
        self.getDataRelay = PublishRelay()
    }
    
    private func createQueryItems(query: [String: String]) -> [URLQueryItem] {
        var queryItems = [URLQueryItem]()
        for (queryItemName, queryItemValue) in query {
            queryItems.append(URLQueryItem(name: queryItemName, value: queryItemValue))
        }
        return queryItems
    }
    
    func getData() -> Observable<Data> {
        return self.getDataRelay.asObservable()
    }
    
    func exec(url: String, query: [String: String]) {
        var urlComponents = URLComponents(string: url)
        urlComponents?.queryItems = createQueryItems(query: query)
        let request = URLRequest(url: (urlComponents?.url)!)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            self.getDataRelay.accept(data)
            print(data)
        }.resume()
    }
    
}
