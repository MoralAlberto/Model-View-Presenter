

protocol DataProviderProtocol {
    associatedtype View
    associatedtype Object
    func objectAtIndexPath(_ index: Int) -> Object
    func configure(item: View, at index: Int)
    func numberOfItemsInSection(_ section: Int) -> Int
}
