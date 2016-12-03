import UIKit

class UserTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}


extension UserTableViewCell: CellProtocol {
    func display(name: String) {
        textLabel?.text = name
    }
            
    func display(age: Int) {
        detailTextLabel?.text = String(describing: age)
    }
}
