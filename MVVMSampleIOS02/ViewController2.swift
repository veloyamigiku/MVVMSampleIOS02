//
//  ViewController2.swift
//  MVVMSampleIOS02
//
//  Created by velo.yamigiku on 2020/11/08.
//  Copyright © 2020 velo.yamigiku. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let margins = view.safeAreaLayoutGuide
        let customView = CustomView()
        customView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(customView)
        customView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        customView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        customView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        
        let customView2 = CustomView()
        customView2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(customView2)
        customView2.topAnchor.constraint(equalTo: customView.bottomAnchor, constant: 10).isActive = true
        customView2.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        customView2.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
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
