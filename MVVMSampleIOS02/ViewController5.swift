//
//  ViewController5.swift
//  MVVMSampleIOS02
//
//  Created by velo.yamigiku on 2020/12/14.
//  Copyright © 2020 velo.yamigiku. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController5: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let salg = self.view.safeAreaLayoutGuide
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: salg.centerXAnchor, constant: 0).isActive = true
        imageView.centerYAnchor.constraint(equalTo: salg.centerYAnchor, constant: 0).isActive = true        
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        imageView.af.setImage(withURL: URL(string: "https://item-shopping.c.yimg.jp/i/g/veds_315122-111-mens")!) { response in
            switch response.result {
            case .success(_):
                print("success")
            case .failure(_):
                print("failure")
            }
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
