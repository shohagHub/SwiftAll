//
//  TypeCasting.swift
//  TypeCasting
//
//  Created by Saleh Enam Shohag on 4/3/20.
//  Copyright © 2020 Saleh Enam Shohag. All rights reserved.
//

import Foundation


class TypeCasting {
    ///library inferred to  it infers a type of [MediaItem] base type of Mobie and Song
    let library = [
        Movie(name: "Casablanca", director: "Michael Curtiz"),
        Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
        Movie(name: "Citizen Kane", director: "Orson Welles"),
        Song(name: "The One And Only", artist: "Chesney Hawkes"),
        Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
    ]
    func checkingType() {
        var movieCount = 0
        var songCount = 0
        //checing type
        for media in library {
            print(media)
            for item in library {
                if item is Movie {
                    movieCount += 1
                } else if item is Song {
                    songCount += 1
                }
            }
        }
        print("Media library contains \(movieCount) movies and \(songCount) songs")
    }
    
    func downCasting() {
        for item in library {
            if let movie = item as? Movie {
                print("Movie: \(movie.name), dir. \(movie.director)")
            } else if let song = item as? Song {
                print("Song: \(song.name), by \(song.artist)")
            }
        }
    }
    
    func anyAnyObject() {
        test()
        let students = ["Oana": "10", "Nori": "ten"]
        let mapStudents = students.compactMapValues(Int.init)
        var things = [Any]()
        things.append(House.village)
        things.append("Shohag")
        var dics = ["k": "fdf", "k2": { (name: String) -> String in "Hello, \(name)" }, "dic": ["inkey": "inValue"]] as [String : AnyObject]
        var d: [String: AnyObject] = ["inKey": NSObject()]
        for (key, value) in dics {
            print(key)
            if value is [String: AnyObject] {
                let v = value as! [String: AnyObject]
                let str = v["inkey"] as? String
                if let s = str {
                    print(s)
                }
            }
        }
    }
}

enum House {
    case village, town
}

//MARK:- Defining a Class Hierarchy for Type Casting

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
struct S {var value: Int = 0}
//let x = S()
func test() {
    if let s = y(x: S(value: 10)) as? S{
        print("s = \(s.value)")
    }
}
func y(x: S) -> AnyObject {
    return x as AnyObject
}
//Q: Why anyobject to value type cast succeed?

struct SimpleStruct {
    var value: Int = 0
}
//From the swift documentation we know
//Any can represent an instance of any type at all, including function types.
//AnyObject can represent an instance of any class type.
//
func casting() {
    var ss1: AnyObject
   // ss1 = SimpleStruct(value: 10) //Value of type 'SimpleStruct' does not conform to 'AnyObject' in assignment
    ss1 = SimpleStruct(value: 10) as AnyObject
    if let ss = ss1 as? SimpleStruct { //Why is this casting succeed
        print(ss.value)
    }
}
