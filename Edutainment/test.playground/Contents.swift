import UIKit

var greeting = "Hello, playground"

var rightButton : Int = 0
var randomValue = Int.random(in: 1...12)
var table : Int = 4
var buttons = [String]()
let option = 1



    rightButton = randomValue * table
    let castRightButton = String(rightButton)
    buttons.append(castRightButton)
    
    var castValue : String = ""
    
    var i: Int = 0
    for _ in 0...1 {
        i = Int.random(in: 1...100)
        
        castValue = String(i)
        buttons.append(castValue)
        print(i)
        
    }
    
    buttons.shuffle()
    
     buttons[option]
    

