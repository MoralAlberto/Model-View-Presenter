import Foundation

class ShowUserPresenter {
    
    var users = [UserViewModel]()
    let interactor: ShowUsersUseCase
    fileprivate let view: ViewProtocol
    
    init(view: ViewProtocol, interactor: ShowUsersUseCase = ShowUsersInteractor()) {
        self.view = view
        self.interactor = interactor
    }
}

extension ShowUserPresenter: ShowUserPresenterProtocol {
    func viewDidLoad() {
        interactor.showUsers()
    }
    
    func presentUsers(users: [UserViewModel]) {
        self.users = users
        view.renderView()
    }
}

extension ShowUserPresenter: DataProviderPresenterProtocol {
    func numberOfItemsInSection(_ section: Int) -> Int {
        return users.count
    }
    
    func configure(item: CellProtocol, at index: Int) {
        let user = users[index]
        item.display(age: user.age)
        item.display(name: user.name)
    }
    
    func objectAtIndexPath(_ index: Int) -> UserViewModel {
        return users[index]
    }
}


