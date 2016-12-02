import Foundation

class ShowUsersInteractor: ShowUsersUseCase {
    private let repository: PersistenceUserProtocol
    var presenter: ShowUserPresenterProtocol?
    
    init(repository: PersistenceUserProtocol = PersistenceClient()) {
        self.repository = repository
    }
    
    func showUsers() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let users = self.repository.fetchUsers()
            let usersViewModel = users.map { UserViewModel.init(user: $0) }

            self.presenter?.presentUsers(users: usersViewModel)
        }
        

    }
}
