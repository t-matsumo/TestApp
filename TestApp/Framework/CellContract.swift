//
//  CellContract.swift
//  TestApp
//
//  Created by tatsuki_matsumoto on 2019/11/09.
//  Copyright © 2019 com.gmail.tatsukimatsumo. All rights reserved.
//

import UIKit

protocol CellContract: UITableViewCell {
    func setup(_ data: Any)
}
