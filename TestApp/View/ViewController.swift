//
//  ViewController.swift
//  TestApp
//
//  Created by tatsuki_matsumoto on 2019/11/09.
//  Copyright © 2019 com.gmail.tatsukimatsumo. All rights reserved.
//

import UIKit

protocol ViewContract {
    func update(_ data: SectionDataList)
    func registerNib()
}

class ViewController: UIViewController, ViewContract, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: TodoListContract!
    var sctionDataList: SectionDataList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.registerNib()
        
        self.presenter = TodoListPresenter(self)
        self.presenter.viewDidLoad()
    }
    
    func update(_ data: SectionDataList) {
        self.sctionDataList = data
        self.tableView.reloadData()
    }
    
    func registerNib() {
        let nib = UINib(nibName: "TodoCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: NSStringFromClass(TodoCell.self))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sctionDataList.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.sctionDataList.numberOfRowsIn(section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowData = self.sctionDataList.getRowDataAt(indexPath)
        let cell = self.tableView.dequeueReusableCell(withIdentifier: rowData.cellId, for: indexPath) as! TodoCell
        
        cell.setup(todoData: rowData.data as! TodoData)
        NSLog("aaaa %lf %lf", cell.contentView.frame.size.width, cell.contentView.frame.size.height)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowData = self.sctionDataList.getRowDataAt(indexPath)
        let cell = self.tableView.dequeueReusableCell(withIdentifier: rowData.cellId) as! TodoCell
        
        cell.setup(todoData: rowData.data as! TodoData)
//        cell.layoutIfNeeded() // △
        cell.updateConstraintsIfNeeded() // o
        NSLog("ccc %lf %lf", cell.systemLayoutSizeFitting(CGSize(width: self.tableView.frame.size.width, height: UIView.noIntrinsicMetric)).width, cell.systemLayoutSizeFitting(CGSize(width: self.tableView.frame.size.width, height: UIView.noIntrinsicMetric)).height)
        return cell.systemLayoutSizeFitting(CGSize(width: self.tableView.frame.size.width, height: UIView.noIntrinsicMetric)).height
    }
}
