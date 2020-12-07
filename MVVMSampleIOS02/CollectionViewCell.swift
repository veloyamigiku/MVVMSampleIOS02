//
//  CollectionViewCell.swift
//  MVVMSampleIOS02
//
//  Created by velo.yamigiku on 2020/12/02.
//  Copyright © 2020 velo.yamigiku. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var label: UILabel!
    var name: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 8
        
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        addSubview(name)
        
    }
    
    override func layoutSubviews() {
        
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        label.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        name.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5).isActive = true
        name.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        name.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        name.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        
    }
    
    
}
