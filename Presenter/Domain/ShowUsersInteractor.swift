import Foundation

class ShowUsersInteractor: ShowUsersUseCase {
    private let repository: UserRepositoryProtocol
    var presenter: ShowUserPresenterProtocol?
    
    init(repository: UserRepositoryProtocol = UserRepository()) {
        self.repository = repository
    }
    
    func showUsers() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let users = self.repository.fetchUsers()
            let usersModel = users.map { UserModel.init(userData: $0) }
            let usersViewModel = usersModel.map { UserViewModel.init(userModel: $0) }

            self.presenter?.presentUsers(users: usersViewModel)
        }
    }
}
