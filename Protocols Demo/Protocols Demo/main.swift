//
//  main.swift
//  Protocols Demo
//
//  Created by Anton Goncharov on 17.05.2020.
//  Copyright © 2020 Anton Honcharov. All rights reserved.
//

protocol CanFly {
    func fly()
}

class Bird {
    var isFemail = true
    
    func layEgg() {
        if isFemail {
            print("Birds can lay eggs")
        }
    }
}

class Eagle: Bird, CanFly {
    func fly() {
        print("The eagle can fly because of wings")
    }
    func soar() {
        print("The eagle can soar because of wings")
    }
}

class Penguin: Bird {
    func swim()  {
        print("The penguin can swim because of form of his body")
    }
}

struct Airplain: CanFly {
    func fly()  {
        print("The airplain uses engine to fly")
    }
}


let myEagle = Eagle()
let myPenguin = Penguin()
let myAirmplain = Airplain()

myAirmplain.fly()
myEagle.fly()
myPenguin.swim()


