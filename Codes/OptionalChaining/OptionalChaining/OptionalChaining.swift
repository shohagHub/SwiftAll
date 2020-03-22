//
//  OptionalChaining.swift
//  OptionalChaining
//
//  Created by Saleh Enam Shohag on 3/3/20.
//  Copyright © 2020 Saleh Enam Shohag. All rights reserved.
//

import Foundation

class OptionalChaining {
    func altToForceUnwrap() {
//        let john = Person()
//        if let roomCount = john.residence?.numberOfRooms {
//            print("John's residence has \(roomCount) room(s).")
//        } else {
//            print("Unable to retrieve the number of rooms.")
//        }
//        john.residence = Residence()
//        if let roomCount = john.residence?.numberOfRooms {
//            print("John's residence has \(roomCount) room(s).")
//        } else {
//            print("Unable to retrieve the number of rooms.")
//        }
//        let roomCount = john.residence!.numberOfRooms
    }
    func accessingProperties() {
        let john = Person()
        if let roomCount = john.residence?.numberOfRooms {
            print("John's residence has \(roomCount) room(s).")
        } else {
            print("Unable to retrieve the number of rooms.")
        }
        // Prints "Unable to retrieve the number of rooms."
        
        let someAddress = Address()
        someAddress.buildingNumber = "29"
        someAddress.street = "Acacia Road"
        john.residence?.address = someAddress //it is difficult to observe that
                                              //this assignment is failed
        //we can do it function then we will see that function is not called
        john.residence?.address = createAddress()
    }
    //Calling Methods Through Optional Chaining
    func callMethodsThroughOptionalChaining() {
        let john = Person()
        if john.residence?.printNumberOfRooms() != nil {
            print("It was possible to print the number of rooms.")
        } else {
            print("It was not possible to print the number of rooms.")
        }
        // Prints "It was not possible to print the number of rooms."
    }
    
    ///Accessing Subscripts Through Optional Chaining
    func accessingSubscripts() {
        let john = Person()
        if let firstRoomName = john.residence?.rooms[0].name {
            print("The first room name is \(firstRoomName).")
        } else {
            print("Unable to retrieve the first room name.")
        }
        
        john.residence?.rooms[0] = Room(name: "Bathroom") //it will fail
        
        let joshHouse = Residence()
        joshHouse.rooms.append(Room(name: "Living Room"))
        joshHouse.rooms.append(Room(name: "Kitchen"))
        john.residence = joshHouse
        
        if let firstRoomName = john.residence?[0].name {
            print("The first room name is \(firstRoomName).")
        } else {
            print("Unable to retrieve the first room name.")
        }
    }
    
    ///Accessing Subscripts of Optional Type
    func accessSubscriptOptional() {
        var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
        testScores["Dave"]?[0] = 91
        testScores["Bev"]?[0] += 1
        testScores["Brian"]?[0] = 72
        print(testScores)
    }
    
    ///Linking Multiple Levels of Chaining
    func multipleLevelOfLinking() {
        let john = Person()
        let joshHouse = Residence()
        joshHouse.rooms.append(Room(name: "Living Room"))
        joshHouse.rooms.append(Room(name: "Kitchen"))
        john.residence = joshHouse
        
        if let johnsStreet = john.residence?.address?.street {
            print("John's street name is \(johnsStreet).")
        } else {
            print("Unable to retrieve the address.")
        }
        
        let johnsAddress = Address()
        johnsAddress.buildingName = "The Larches"
        johnsAddress.street = "Laurel Street"
        john.residence?.address = johnsAddress
        
        if let johnsStreet = john.residence?.address?.street {
            print("John's street name is \(johnsStreet).")
        } else {
            print("Unable to retrieve the address.")
        }
    }
    
    ///Chaining on Methods with Optional Return Values
    func chainingOnMethod() {
        let john = Person()
        let joshHouse = Residence()
        joshHouse.rooms.append(Room(name: "Living Room"))
        joshHouse.rooms.append(Room(name: "Kitchen"))
        john.residence = joshHouse
        
        let johnsAddress = Address()
        johnsAddress.buildingName = "The Larches"
        johnsAddress.street = "Laurel Street"
        john.residence?.address = johnsAddress
        
        if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
            print("John's building identifier is \(buildingIdentifier).")
        }
        
        if let beginsWithThe =
            john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
            if beginsWithThe {
                print("John's building identifier begins with \"The\".")
            } else {
                print("John's building identifier does not begin with \"The\".")
            }
        }
    }
}

func createAddress() -> Address {
    print("\(#function)- Function was called.")

    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"

    return someAddress
}

//MARK:- Optional Chaining as an Alternative to Forced Unwrapping
//it is commented because below uses same with different propery classes
//
//class Residence {
//    var numberOfRooms = 1
//}



//MARK:- Defining Model Classes for Optional Chaining
class Person {
    var residence: Residence?
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

class Room {
    let name: String
    init(name: String) { self.name = name }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}
