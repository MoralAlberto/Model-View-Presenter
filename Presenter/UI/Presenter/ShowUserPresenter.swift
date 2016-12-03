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
