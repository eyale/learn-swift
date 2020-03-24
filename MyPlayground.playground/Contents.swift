//import UIKit
//
//var str = "Hello, playground"
//print(str);
//var name = "Honcharov Eyal"
//
//let apples = 3
//let pi: Double = 3.14
//let title = "I have \(apples) apples. And Pi is: \(pi)"
//print(title)
//
//let severalStrings = """
//sort of several
//strings
//My name is \(name)
//"""
//print(severalStrings);
//
//var shopingList = ["fish", "water", "fruits"]
//print(shopingList[1])
//print("Here is \(shopingList.index(after: 0)) thing that I should by: \(shopingList[0])")
//
//var employe = [
//    "Josh": "DevOps",
//    "Nathan": "Swift Developer"
//]
//employe["Ethan"] = "PM"
//print("\(employe)")
//
//shopingList.append(contentsOf: ["milk", "eggs"])
//print(shopingList)
//
//let emptyArr = [Int]()
//
//for shopingItem in shopingList {
//    if shopingItem == "eggs" {
//        shopingList.append("bread")
//    } else {
//        print("shopingItem: \(shopingItem)")
//    }
//}
//print(shopingList)
//
//var optionalName: String? = nil
//print(optionalName == nil)
//
//var optionalTitle: String? = "Developer"
//var greeting = "Hi"
//if let name = optionalName {
//    greeting = "Hi, \(name)"
//}
//
//print(greeting)
//
//let vegetable = "red pepper"
//switch vegetable {
//case "celery":
//    print("Add some raisins and make ants on a log.")
//case "cucumber", "watercress":
//     print("That would make a good tea sandwich.")
//case let x where x.hasPrefix("red"):
//     print("Is it a spicy \(x)?")
//default:
//     print("Everything tastes good in soup.")
//}
//
//let interestingNumbers = [
//    "Prime": [2, 3, 5, 7, 11, 13],
//    "Fibonacci": [1, 1, 2, 3, 5, 8],
//    "Square": [1, 4, 9, 16, 25],
//]
//var largest = 0
//var lagestKind = ""
//for (kind, numbers) in interestingNumbers {
//    for number in numbers {
//        if largest < number {
//            lagestKind = kind
//            largest = number
//        }
//    }
//}
//print("""
//The largest number from: \(lagestKind)
//The value of largest: \(largest)
//""")
//
//var firstForLoop = 0
//for i in 0..<4 {
//    print("\(firstForLoop) += \(i)")
//    firstForLoop += i
//}
//print(firstForLoop)
//
//func greet(_ name: String, day: String) -> String {
//    return "Hi \(name), today is \(day)"
//}
//print(greet("Ethan", day: "Tuesday"))
//
//func calculateStatistics(_ scores: [Int]) -> (min: Int, max: Int, sum: Int) {
//    var min = scores[0]
//    var max = scores[0]
//    var sum = 0
//
//    for score in scores {
//        if score > max {
//            max = score
//        } else if score < min {
//            min = score
//        }
//        sum += score
//    }
//
//    return (min, max, sum)
//}
//let statistics = calculateStatistics([5, 3, 100, 3, 9])
//print("min = \(statistics.0), max = \(statistics.1), sum = \(statistics.sum)")
//
//func returnFifteen() -> Int {
//    var y = 10
//    func add() {
//        y += 5
//    }
//    add()
//    return y
//}
//returnFifteen()
//
//func makeIncrementer() -> ((Int) -> (Int)) {
//    func addOne(_ number: Int) -> Int {
//        return 1 + number
//    }
//    return addOne
//}
//var increment = makeIncrementer()
//increment(8)

//func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
//    for item in list {
//        if condition(item) {
//            return true
//        }
//    }
//    return false
//}
//func lessThanTen(number: Int) -> Bool {
//    return number < 10
//}
//var numbers = [20, 19, 7, 12]
//hasAnyMatches(list: numbers, condition: lessThanTen)

//var numbers = [2,3,5,1,4,6]
//numbers.map({ (number: Int) -> Int in
//    if number % 2 != 0 {
//        return 0
//    }
//    return number
//})
//print(numbers);
//
//let mappedNumbers = numbers.map({ number in 3 * number })
//print(mappedNumbers)

//var numbers = [2,3,5,1,4,6]
//let mappedNumbers = numbers.map({ number in 3 * number })
//print(mappedNumbers)
//let sortedNumbers = numbers.sorted { $0 > $1 }
//print(sortedNumbers)

//
//class Shape {
//    var name: String
//    var numberOfSlides: Int = 0
//
//    init(name: String) {
//        self.name = name
//    }
//
//    func simpleDescription() -> String {
//        return "A shape with \(numberOfSlides) sides"
//    }
//
//    func getShapesName() -> String {
//        return self.name
//    }
//    func getShapesCorners(corners: Int) -> Int {
//        return corners
//    }
//}
//var shape = Shape(name: "Triangle")
//shape.numberOfSlides = 8
//var shapeDesc = shape.simpleDescription()
//var shapeName = shape.getShapesName()
//var shapeCorners = shape.getShapesCorners(corners: 4)

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

class Circle: NamedShape {
    var radius: Int
    
    init(radius: Int, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    func area() -> Double {
        return (Double(radius) * Double(radius)) * Double.pi
    }
    
    override func simpleDescription() -> String {
        return "A \(self.name)'s area = \(area())"
    }
}
let circle = Circle(radius: 88, name: "My First Circle")
circle.area()
circle.simpleDescription()
