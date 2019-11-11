//
//  TodoListPresenter.swift
//  TestApp
//
//  Created by tatsuki_matsumoto on 2019/11/09.
//  Copyright © 2019 com.gmail.tatsukimatsumo. All rights reserved.
//

import Foundation

protocol TodoListContract {
    func viewDidLoad()
}

class TodoListPresenter: TodoListContract {
    
    let view: ViewContract
    
    init(_ view: ViewContract) {
        self.view = view
    }
    
    func viewDidLoad() {
        let data = createData()
        self.view.update(data)
    }
    
    func createData() -> SectionDataList {
        let sectionDataList = SectionDataList()
        for sectionIndex in 0..<10 {
            let section = SectionData(String(sectionIndex))
            for rowIndex in 0..<10 {
                var str = "uuuuu"
                if (rowIndex % 3 == 0) {
                    str = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaiiiiiiiiii"
                }
                let data = TodoData(title: String(rowIndex) + str)
                let row = RowData(data, NSStringFromClass(TodoCell.self))
                section.addRowData(row)
            }
            
            sectionDataList.add(section)
        }
        
        return sectionDataList
    }
}
