import Foundation

class UserRepository: UserRepositoryProtocol {
    func fetchUsers() -> [UserModel] {
        // Here we can try a strategy, get data from memory, database, apiclient...
        let memory = MemoryDataSource()
        let users = memory.fetchUsers()
        let usersModel = users.map { UserModel.init(userData: $0) }
        return usersModel
    }
}
