//
//  CollectionViewCell.swift
//  MVVMSampleIOS02
//
//  Created by velo.yamigiku on 2020/12/02.
//  Copyright © 2020 velo.yamigiku. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var name: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 8
        
    }
}
