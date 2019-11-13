//
//  TodoCell.swift
//  TestApp
//
//  Created by tatsuki_matsumoto on 2019/11/09.
//  Copyright © 2019 com.gmail.tatsukimatsumo. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {
    @IBOutlet weak var containrt: UIView!
    
    @IBOutlet weak var title: UILabel!
    
    func setup(todoData: TodoData) {
        self.title.text = todoData.title
    }
}
