import Foundation

class ShowUserPresenter {
    
    var users = [UserViewModel]()
    let interactor: ShowUsersUseCase
    fileprivate let view: ViewProtocol
    
    init(view: ViewProtocol, interactor: ShowUsersUseCase = ShowUsersInteractor()) {
        self.view = view
        self.interactor = interactor
    }
    
    func viewCreated() {
        interactor.showUsers()
    }
}

extension ShowUserPresenter: ShowUserPresenterProtocol {
    func presentUsers(users: [UserViewModel]) {
        self.users = users
        view.renderView()
    }
}
