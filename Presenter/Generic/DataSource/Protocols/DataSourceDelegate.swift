

protocol DataSourceDelegate: class {
    associatedtype Object
    func cellIdentifierForObject(_ object: Object) -> String
    func selectedItem(at row: Int)
}
