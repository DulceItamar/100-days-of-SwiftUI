import UIKit




enum UserError: Error {
    case badID, networkFailed
}


func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}


let user = (try? getUser(id: 23)) ?? "Anonymus"
    print("User: \(user)")






