//
//  ViewController.swift
//  MVVMSampleIOS02
//
//  Created by velo.yamigiku on 2020/10/21.
//  Copyright © 2020 velo.yamigiku. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://shopping.yahooapis.jp/ShoppingWebService/V1/json/categorySearch?appid=dj00aiZpPWVheHgxT3VmSmp0eSZzPWNvbnN1bWVyc2VjcmV0Jng9YzU-&category_id=1")
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            do {
                let json = try JSON(data: data)
                print(json)
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }


}

