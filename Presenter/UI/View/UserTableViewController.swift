//
//  ViewController.swift
//  Presenter
//
//  Created by Alberto Moral on 01/12/2016.
//  Copyright © 2016 Alberto Moral. All rights reserved.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    var tableViewDataSource: TableViewDataSource<UserTableViewController, ShowUserPresenter, UserTableViewCell>!
    var presenter: ShowUserPresenter?
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: String(describing: UserTableViewCell.self))
        
        tableViewDataSource = TableViewDataSource(tableView: tableView, dataProvider: presenter!, delegate: self)
        
        presenter?.viewDidLoad()
    }
}

extension UserTableViewController: DataSourceDelegate {
    func cellIdentifierForObject(_ object: UserViewModel) -> String {
        return String(describing: UserTableViewCell.self)
    }
    
    func selectedItem(at row: Int) {
        presenter?.selectedUser(at: row)
    }
}

extension UserTableViewController: ViewProtocol {
    func renderView() {
        tableView.reloadData()
    }
}

