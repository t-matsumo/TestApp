//
//  RowData.swift
//  TestApp
//
//  Created by tatsuki_matsumoto on 2019/11/09.
//  Copyright © 2019 com.gmail.tatsukimatsumo. All rights reserved.
//

import Foundation

class RowData {
    let cellId: String
    let data: Any
    
    init(_ data: Any, _ cellId: String) {
        self.data = data
        self.cellId = cellId
    }
}
