import Foundation

class GetUsersByNameInteractor: GetUsersByNameUseCase {
    private let repository: UserRepositoryProtocol
    var presenter: ShowUserPresenterProtocol?
    
    init(repository: UserRepositoryProtocol = UserRepository()) {
        self.repository = repository
    }
    
    func getUsersByName() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let usersModel = self.repository.fetchUsers()
            let usersViewModel = usersModel
                                        .map { UserViewModel.init(userModel: $0) }
                                        .sorted { $0.age < $1.age }
            self.presenter?.presentUsers(users: usersViewModel)
        }
    }
}
