import Foundation

class PersistenceClient: PersistenceUserProtocol {
    
    func fetchUsers() -> [UserData] {
        let userOne = UserData(firstName: "Alberto", lastName: "Moral", age: 28, addess: "El clot")
        let userTwo = UserData(firstName: "Daniel", lastName: "Gómez", age: 20, addess: "Maragall")
        let userThree = UserData(firstName: "Moral", lastName: "Gómez", age: 22, addess: "Horta")
        return [userOne, userTwo, userThree]
    }
}
