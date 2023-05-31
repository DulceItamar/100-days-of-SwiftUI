import UIKit


//Celsius to Fahrenheit
//_°C * (9/5) + 32 = _°F

let Celsius: Double = 32.00
var toFahrenheit  = ((Celsius * (9 / 5)) + 32)
print("\(Celsius)°C is equivalent to \(toFahrenheit)°F")


// Fahrenheit to Calsius
//_°F  -32 * (5/9) = _°C
let Fahrenheit:Double = 52
var toCelsius = (Fahrenheit - 32) * (5 / 9)
print("\(Fahrenheit)°F is equivalent to \(toCelsius)°C")


let filenames = ["me.jpg","work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    print("Found picture: \(filename)")
}

var output = [String]()
var value: String = ""

for i in 1...100{
    if i % 15 == 0 {
        value = "FizzBuz"

    } else if i % 3 == 0 {
        value = "Fizz"

    } else if i % 5 == 0 {
        value = "Buzz"

    } else {
        value = String(i)
    }
    output.append(value)
    
}
print(output)

var output2 = [String]()
var value2: String = ""
for j in 1...100 {
    if j.isMultiple(of: 3) && j.isMultiple(of: 5){
        value2 = "FizzBuzz"
    } else if j.isMultiple(of: 5){
        value2 = "Buzz"
    } else if j.isMultiple(of: 3) {
        value2 = "Fizz"
    } else {
        value2 = String(j)
    }
    
    output2.append(value2)
    
}

print(output2)

