//
//  SectionOfCustomData.swift
//  MVVMSampleIOS02
//
//  Created by velo.yamigiku on 2020/10/27.
//  Copyright © 2020 velo.yamigiku. All rights reserved.
//

import Foundation
import RxDataSources

struct SectionOfCustomData {
    var header: String
    var items: [Item]
}

extension SectionOfCustomData: SectionModelType {
    
    typealias Item = CustomData
    
    init(original: SectionOfCustomData, items: [CustomData]) {
        self = original
        self.items = items
    }
}
