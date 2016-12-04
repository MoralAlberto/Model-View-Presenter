
struct UserViewModel {
    let name: String
    let age: Int
}

extension UserViewModel {
    init(userModel: UserModel) {
        self.name = userModel.name
        self.age = userModel.age
    }
}

