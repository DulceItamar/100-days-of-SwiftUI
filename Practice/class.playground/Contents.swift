import UIKit


class Statue {
    var scultor = "Unknown"
}

var venusDeMilo = Statue()

venusDeMilo.scultor = "Alexandros of Antioch"

var david = Statue()
david.scultor = "Michaelangelo"

//Creates differents statues
print(venusDeMilo.scultor)
print(david.scultor)

class Author {
    var name = "Anonymous"
}
var dickens = Author()
dickens.name = "Charles Dickens"
var austen = dickens
austen.name = "Jane Austen"
print(dickens.name)
print(austen.name)


class User {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}



class School {
    var name = "Paul"
}

var student = School()
student.name = "Taylor"
student = School()
print(student.name)

