import UIKit

struct Car {
    let model: String
    let seats: Int
    var currentGear = 0
    
    mutating func gearsUp(change up: Int) throws {
        
        if up < 0 || up > 5 {
            throw ErrorHandle.outRange
        }
        
        if currentGear < 0 || currentGear > 5{
            throw ErrorHandle.outRange
        }
            currentGear += up
 
    }
    
    mutating func gearsDown(change down: Int) throws {
        if down < 0 || down > 5 {
            throw ErrorHandle.outRange
        }
        if currentGear < 0 || currentGear > 5{
            throw ErrorHandle.outRange
        }
        
            currentGear -= down
        }

    
    enum ErrorHandle: Error {
        case outRange
    }
}

var ferrari = Car(model: "Ferrari", seats: 4, currentGear: 3)
do {
    try ferrari.gearsDown(change: 2)
    print("La velocidad del modelo \(ferrari.model) es: \(ferrari.currentGear)")
    
    try ferrari.gearsUp(change: 4)
    print("La velocidad del modelo \(ferrari.model) es: \(ferrari.currentGear)")
    
} catch Car.ErrorHandle.outRange {
    print("Esta fuera del rango")
} catch {
    print(error)
}


