import UIKit

var pizzaInInches: Int = 12 {
  willSet {
    print("the old value", pizzaInInches)
    print(newValue)
  }
  didSet {
    print(oldValue)
    print("the new value", pizzaInInches)
    if pizzaInInches >=  18 {
      print("Invalid size specified, pizza in inches set to 18")
      pizzaInInches = 18
    }
  }
}

pizzaInInches = 30
print(pizzaInInches)

var numberOfPeople: Int = 6
let slicesPerPerson: Int = 3

var numberOfSlices: Int {
  get {
    return pizzaInInches - 4
  }
  set {
    print("new value of numberOfSlices = \(newValue)")
  }
}

var numberOfPizza: Int {
  get {
    let numberOfPeopleFetPerPizza = numberOfSlices / slicesPerPerson
    return numberOfPeople / numberOfPeopleFetPerPizza
  }
  set {
    let totalSlices = numberOfSlices * newValue
    numberOfPeople = totalSlices / slicesPerPerson
  }
}

numberOfPizza = 4

print(numberOfPeople)



let width = 1.5
let height = 2.3

var bucketsOfPaint: Int {
  get {
    let area = width * height
    let areaCoveredPerBucket = 1.5
    let numbersOfBuckets = area / areaCoveredPerBucket
    return Int(numbersOfBuckets.rounded(.up))
  }
  set {
    let areaCoveredPerBucket = 1.5
    let areaCanCover = areaCoveredPerBucket * Double(newValue)
    print(areaCanCover)
    areaCanCover.rounded(.up)
  }
}

print("bucketsOfPaint", bucketsOfPaint)

bucketsOfPaint = 6
