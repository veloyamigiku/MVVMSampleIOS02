//
//  ViewController.swift
//  MVVMSampleIOS02
//
//  Created by velo.yamigiku on 2020/10/21.
//  Copyright © 2020 velo.yamigiku. All rights reserved.
//

import UIKit
import SwiftyJSON
import RxSwift

class ViewController: UIViewController {
    
    private var disposeBag: DisposeBag!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        disposeBag = DisposeBag()
        
        let httpGet = HttpGet()
        httpGet
            .exec(
                url: "https://shopping.yahooapis.jp/ShoppingWebService/V3/itemSearch",
                query: [
                    "appid": "dj00aiZpPWVheHgxT3VmSmp0eSZzPWNvbnN1bWVyc2VjcmV0Jng9YzU-",
                    "query": "last of us"])
        httpGet
            .getData()
            .subscribe(onNext: { (data) in
                do {
                    let json = try JSON(data: data)
                    print(json)
                } catch let jsonError {
                    print(jsonError)
                }
            })
            .disposed(by: disposeBag)
    }


}

