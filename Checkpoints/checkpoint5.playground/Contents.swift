import UIKit

//Input
let luckyNumbers = [7,4,38,21,16,15,12,33,31,49]

//Tasks:
//Filter out any numbers that are even
var NoEvenNumbers = luckyNumbers.filter { $0 % 2 == 1 }
print(NoEvenNumbers)

//Sort the array in ascending order
var sortedNumbers = NoEvenNumbers.sorted { $0 < $1}
print(sortedNumbers)

//Map them to strings in the format "7 is a lucky number"
var severalLuckyNumber = sortedNumbers.map { number in
    "\(number) is a lucky number "
    
}
print(severalLuckyNumber)

//Print the resulting array, one item per line
let resultado = severalLuckyNumber.joined(separator: "\n")
print(resultado)
