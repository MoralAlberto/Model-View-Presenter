
struct UserViewModel {
    let name: String
    let age: Int
}

extension UserViewModel {
    init(user: UserData) {
        self.name = user.firstName + " " + user.lastName
        self.age = user.age
    }
}

