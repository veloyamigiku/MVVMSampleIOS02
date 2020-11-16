//
//  CustomView.swift
//  MVVMSampleIOS02
//
//  Created by velo.yamigiku on 2020/11/08.
//  Copyright © 2020 velo.yamigiku. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    private var label1: UILabel!
    private var label2: UILabel!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .orange
        
        label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.text = "HogeFuga\nHoge\nSample"
        label1.numberOfLines = 0
        label1.backgroundColor = .yellow
        self.addSubview(label1)
        
        label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.text = "HogeFuga2\nSample\nHuga"
        label2.numberOfLines = 0
        label2.backgroundColor = .blue
        self.addSubview(label2)
        
    }
    
    override func layoutSubviews() {
        
        label1.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        label1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        label1.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 10).isActive = true
        label2.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        label2.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        
        self.bottomAnchor.constraint(equalTo: label2.bottomAnchor, constant: 10).isActive = true
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
