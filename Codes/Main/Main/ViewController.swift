//
//  ViewController.swift
//  Main
//
//  Created by Saleh Enam Shohag on 29/2/20.
//  Copyright © 2020 Saleh Enam Shohag. All rights reserved.
//

import UIKit

import StructureAndClasses
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let pClass = PublicClass()
        pClass.publicMethod()
        if let dictionary = Bundle.main.infoDictionary {
            if let readValue = dictionary["permission.read"] as? String {
                print(readValue)
            }
            
        }
    }


}

class Father {
    var name: String = ""
}
extension Father {
    //Designated initializer is not allowed
    convenience init(name: String){
        self.init()
        self.name = name
    }
}

struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
}

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

