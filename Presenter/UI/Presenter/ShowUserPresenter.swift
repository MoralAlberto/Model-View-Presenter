import Foundation

class ShowUserPresenter {
    
    var users = [UserViewModel]()
    let interactor: GetUsersUseCase
    fileprivate let view: ViewProtocol
    
    init(view: ViewProtocol, interactor: GetUsersUseCase = ShowUsersInteractor()) {
        self.view = view
        self.interactor = interactor
    }
}

extension ShowUserPresenter: ShowUserPresenterProtocol {
    func viewDidLoad() {
        interactor.getUsers()
    }
    
    func presentUsers(users: [UserViewModel]) {
        self.users = users
        view.renderView()
    }
    
    func selectedUser(at index: Int) {
        let user = users[index]
        print("User \(user.name)")
    }
}

extension ShowUserPresenter: DataProviderProtocol {
    func numberOfItemsInSection(_ section: Int) -> Int {
        return users.count
    }
    
    func configure(item: BaseCellProtocol, at index: Int) {
        let user = users[index]
        let convertItem = item as? CellProtocol
        convertItem?.display(age: user.age)
        convertItem?.display(name: user.name)
    }
    
    func objectAtIndexPath(_ index: Int) -> UserViewModel {
        return users[index]
    }
}


