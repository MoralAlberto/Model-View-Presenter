import UIKit

class TableViewDataSource <Delegate: DataSourceDelegate, Data: DataProviderPresenterProtocol, Cell: UITableViewCell>: NSObject, UITableViewDataSource, UITableViewDelegate where Delegate.Object == Data.Object, Cell: CellProtocol, Data.View == CellProtocol {
    
    fileprivate var tableView: UITableView
    fileprivate var dataProvider: Data
    fileprivate var delegate: Delegate
    
    required init(tableView: UITableView, dataProvider: Data, delegate: Delegate) {
        self.tableView = tableView
        self.dataProvider = dataProvider
        self.delegate = delegate
        
        super.init()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //  MARK: TableView DataSource
    
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
    
    //  MARK: TableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate.selectedItem(at: indexPath.row)
    }
}
