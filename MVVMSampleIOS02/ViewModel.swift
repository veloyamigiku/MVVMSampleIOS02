//
//  ViewModel.swift
//  MVVMSampleIOS02
//
//  Created by velo.yamigiku on 2020/11/02.
//  Copyright © 2020 velo.yamigiku. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay
import SwiftyJSON

class ViewModel {
    
    private var disposeBag: DisposeBag
    private var items: [CustomData]!
    private var itemsRelay: PublishRelay<[SectionOfCustomData]>
    private var httpGet: HttpGet
    private var itemsData: Observable<Data>
    
    init() {
        disposeBag = DisposeBag()
        items = []
        itemsRelay = PublishRelay()
        httpGet = HttpGet()
        itemsData = httpGet.getData()
        
        setItemsDataSubscribe()
    }
    
    private func setItemsDataSubscribe() {
        
        itemsData.subscribe(onNext: { data in
            do {
                let json = try JSON(data: data)
                let jsonItems = json["hits"]
                var customDatas: [CustomData] = []
                for (_, jsonItem) in jsonItems {
                    customDatas.append(CustomData(str: jsonItem["name"].stringValue))
                    print(jsonItem["name"])
                }
                self.items.append(contentsOf: customDatas)
                let sections = [
                    SectionOfCustomData(header: "item", items: self.items)
                ]
                self.itemsRelay.accept(sections)
            } catch let jsonError {
                print(jsonError)
            }
        }).disposed(by: disposeBag)
        
    }
    
    func item() -> Observable<[SectionOfCustomData]> {
        return itemsRelay.asObservable()
    }
    
    func getItem() {
        httpGet.exec(
            url: "https://shopping.yahooapis.jp/ShoppingWebService/V3/itemSearch",
            query: [
                "appid": "dj00aiZpPWVheHgxT3VmSmp0eSZzPWNvbnN1bWVyc2VjcmV0Jng9YzU-",
                "query": "last of us"])
    }
}
