import UIKit


enum ErrorNumber: Error {
    case outOfRange, noRoot

}

func squareIntNum(_ number: Int) throws -> Int {
    var selectedNum = 0
    switch number {
    case 1...10_000:
        for option in 1...100{
            
            if number == (option * option) {
                selectedNum = option
                break
            }
        }
        if selectedNum == 0 {
            throw ErrorNumber.noRoot
        }
    default:
        throw ErrorNumber.outOfRange
    }
    return selectedNum
}

let value = 25
do {
    let result = try squareIntNum(value)
    print("El resultado es \(result)")
} catch ErrorNumber.outOfRange {
    print("Solo se aceptan numeros dentro del rango de 1 al 10,000, intente otro número")
} catch ErrorNumber.noRoot {
    print("No se encuentra la raíz")
}




enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
    
}


let string = "12345"

do{
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short{
    print("Please use a longer password")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error")
}

func greetUser(){
    print("Hi there!")
}

greetUser()

var greetCopy = greetUser

greetCopy()
