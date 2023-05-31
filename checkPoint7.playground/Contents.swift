import UIKit

class Animal {
    var legs: Int
    
    init(legs: Int){
        self.legs = legs
    }
}

class Dog: Animal {
    

    func speak(){
        print("woof!")
    }

}

class Corgi: Dog {
    
    override func speak() {
        print("Corgi barking is woof, woof")
    }
}


class Poodle: Dog {
    override func speak() {
        print("Poodle barking is woooof, woooof")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init(isTame: Bool, legs: Int) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak(){
        print("Meow")
    }
}

class Persian: Cat {
    
    override func speak() {
        print("Meoow Meooow")
    }
}

class Lion: Cat {
    override func speak() {
        print("Grrrrr Grrrrr")
    }
}

let doggy = Dog(legs: 4)
doggy.speak()
let corgi = Corgi(legs: 4)
corgi.speak()
let poddleDoggie = Poodle(legs: 4)
poddleDoggie.speak()

let persianCat = Persian(isTame: true, legs: 4)
persianCat.speak()

let lion = Lion(isTame: false, legs: 4)
lion.speak()
