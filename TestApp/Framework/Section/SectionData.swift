//
//  SectionData.swift
//  TestApp
//
//  Created by tatsuki_matsumoto on 2019/11/09.
//  Copyright © 2019 com.gmail.tatsukimatsumo. All rights reserved.
//

import Foundation

class SectionData {
    var rowDatas: [RowData] = []
    let sectionTitle: String
    
    lazy var numberOfRows = self.rowDatas.count
    
    init(_ title: String) {
        self.sectionTitle = title
    }
    
    func rowDataAt(_ row: Int) -> RowData {
        self.rowDatas[row]
    }
    
    func addRowData(_ rowData: RowData) {
        self.rowDatas.append(rowData)
    }
}
