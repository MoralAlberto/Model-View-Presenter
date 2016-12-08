import Foundation

struct UserModel {
    let name: String
    let age: Int
}

extension UserModel {
    init(userData: UserData) {
        self.name = userData.firstName + " " + userData.lastName
        self.age = userData.age
    }
}
