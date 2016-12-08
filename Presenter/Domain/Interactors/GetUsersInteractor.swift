import Foundation

class ShowUsersInteractor: GetUsersUseCase {
    private let repository: UserRepositoryProtocol
    var presenter: ShowUserPresenterProtocol?
    
    init(repository: UserRepositoryProtocol = UserRepository()) {
        self.repository = repository
    }
    
    func getUsers() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let usersModel = self.repository.fetchUsers()
            let usersViewModel = usersModel.map { UserViewModel.init(userModel: $0) }
            self.presenter?.presentUsers(users: usersViewModel)
        }
    }
}
