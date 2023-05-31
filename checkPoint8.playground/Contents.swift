import UIKit

var greeting = "Hello, playground"

protocol Building {
    var rooms: Int { get set }
    var cost: Int { get set }
    var agentName: String { get set }
    
    
    func salesSummary()
}

struct House: Building {
    var rooms: Int = 4
    var cost: Int = 500_000
    var agentName: String
    func salesSummary() {
        print("This house has a cost of \(cost) and has \(rooms) rooms. The agency name is \(agentName)")
    }
    
}

struct Office: Building {
    var rooms: Int = 8
    
    var cost: Int = 1_200_999
    
    var agentName: String
    
    func salesSummary() {
        print("This office is for saling and its cost is \(cost), it has \(8) big rooms and the agency name is \(agentName)")
    }
    
    
}

var house = House(agentName: "The Oak real State, S.A de C.V. ")
var office = Office(agentName: "The Willow real State, S.A de C.V")


house.salesSummary()
office.salesSummary()
//
//protocol Building {
//    var buildingDescription: String { get }
//    var floorNumber: Int { get set}
//    var isHasparking: Bool { get}
//    var ownApartment: Bool { get set }
//    mutating func rentOrOwn(ownAparment: Bool)
//    func showDescription()
//
//
//}
//
//
//struct House: Building {
//
//    var buildingDescription = "It is used to live with my family and my pets"
//
//    var floorNumber: Int = 2
//
//    var isHasparking: Bool = true
//
//    var ownApartment: Bool
//
//
//    mutating func rentOrOwn(ownAparment ownApartment: Bool) {
//        if ownApartment {
//            print("This house is mine")
//
//        } else {
//            print("This house is not mine, it is for rent")
//        }
//    }
//
//    func showDescription() {
//        print(buildingDescription)
//    }
//
//
//
//}
//
//struct Office: Building {
//
//
//    var buildingDescription: String = "This building is used to work"
//
//    var floorNumber: Int = 3
//
//    var isHasparking: Bool = true
//
//    var ownApartment: Bool = false
//
//    mutating func rentOrOwn(ownAparment: Bool) {
//
//        if !ownAparment{
//            print("This is not for rent because you don't use this building for living but for working")
//
//        }
//    }
//
//    func showDescription() {
//        print(buildingDescription)
//    }
//
//}
