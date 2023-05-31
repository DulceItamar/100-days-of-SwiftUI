import UIKit

func checkpoint9(array: [Int]?) -> [Int]?{
    
    guard let array = array else {
        print("It's nil")
        return nil
    }
    print("It works!")
    return array
    
}

let noValues: [Int]? = nil
let values: [Int]? = [200,300,400, 500, 600, 700]

let check = checkpoint9(array: values)?.randomElement() ?? Int.random(in: 1...100)
print(check)


func answer(array: [Int]?) -> Int {return array?.randomElement() ?? Int.random(in: 1...100)}
print(answer(array: nil))
print(answer(array: values))
