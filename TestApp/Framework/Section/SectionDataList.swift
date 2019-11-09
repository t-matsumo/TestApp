//
//  SectionDataList.swift
//  TestApp
//
//  Created by tatsuki_matsumoto on 2019/11/09.
//  Copyright © 2019 com.gmail.tatsukimatsumo. All rights reserved.
//

import Foundation

class SectionDataList {
    var datas: [SectionData] = []
    lazy var count = self.datas.count
    
    func get(_ section: Int) -> SectionData {
        datas[section]
    }
    
    func getRowDataAt(_ indexPath: IndexPath) -> RowData {
        self.get(indexPath.section).rowDataAt(indexPath.row)
    }
    
    func numberOfRowsIn(_ section: Int) -> Int {
        datas[section].numberOfRows
    }
    
    func add(_ sectionData: SectionData) {
        datas.append(sectionData)
    }
}
