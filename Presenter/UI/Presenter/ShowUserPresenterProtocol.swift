
protocol ShowUserPresenterProtocol: BasePresenter {
    func presentUsers(users: [UserViewModel])
    func selectedUser(at index: Int)
}

