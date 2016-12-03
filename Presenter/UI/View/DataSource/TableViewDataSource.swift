import UIKit

protocol DataSourceDelegate: class {
    associatedtype Object
    func cellIdentifierForObject(_ object: Object) -> String
//    func selectedItem(object: Object)
}

protocol DataProviderPresenterProtocol {
    associatedtype View
    associatedtype Object
    func objectAtIndexPath(_ index: Int) -> Object
    func configure(item: View, at index: Int)
    func numberOfItemsInSection(_ section: Int) -> Int
}


class TableViewDataSource <Delegate: DataSourceDelegate, Data: DataProviderPresenterProtocol, Cell: UITableViewCell>: NSObject, UITableViewDataSource where Delegate.Object == Data.Object, Cell: CellProtocol, Data.View == CellProtocol {
    
    fileprivate var tableView: UITableView
    fileprivate var dataProvider: Data
    fileprivate var delegate: Delegate
    
    required init(tableView: UITableView, dataProvider: Data, delegate: Delegate) {
        self.tableView = tableView
        self.dataProvider = dataProvider
        self.delegate = delegate
        
        super.init()
        
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider.numberOfItemsInSection(0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let object = dataProvider.objectAtIndexPath(indexPath.row)
        let objectIdentifier = delegate.cellIdentifierForObject(object)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: objectIdentifier, for: indexPath) as? Cell else {
            fatalError("Unexpected cell type at \(indexPath)")
        }
        dataProvider.configure(item: cell, at: indexPath.row)
        return cell
    }
}
