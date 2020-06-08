import UIKit


////Basis
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
////_____________________________________________________________________________
//func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
//    for item in list {
//        if condition(item) {
//            return true
//        }
//    }
//    return false
//}
//func lessThanTen(number: Int) -> Bool {
//    return number < 2
//}
//var numbers = [20, 19, 7, 12]
//hasAnyMatches(list: numbers, condition: lessThanTen)
//_____________________________________________________________________________
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
////_____________________________________________________________________________
//var numbers = [2,3,5,1,4,6]
//let mappedNumbers = numbers.map({ number in 3 * number })
//print(mappedNumbers)
//let sortedNumbers = numbers.sorted { $0 > $1 }
//print(sortedNumbers)

////Classes_________________________________________________________________________
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
//
//class NamedShape {
//    var numberOfSides: Int = 0
//    var name: String
//
//    init(name: String) {
//        self.name = name
//    }
//
//    func simpleDescription() -> String {
//        return "A shape with \(numberOfSides) sides."
//    }
//}
//class Square: NamedShape {
//    var sideLength: Double
//
//    init(sideLength: Double, name: String) {
//        self.sideLength = sideLength
//        super.init(name: name)
//        numberOfSides = 4
//    }
//
//    func area() -> Double {
//        return sideLength * sideLength
//    }
//
//    override func simpleDescription() -> String {
//        return "A square with sides of length \(sideLength)."
//    }
//}
//let test = Square(sideLength: 5.2, name: "my test square")
//test.area()
//test.simpleDescription()
//
//class Circle: NamedShape {
//    var radius: Int
//
//    init(radius: Int, name: String) {
//        self.radius = radius
//        super.init(name: name)
//    }
//    func area() -> Double {
//        return (Double(radius) * Double(radius)) * Double.pi
//    }
//
//    override func simpleDescription() -> String {
//        return "A \(self.name)'s area = \(area())"
//    }
//}
//let circle = Circle(radius: 88, name: "My First Circle")
//circle.area()
//circle.simpleDescription()
//
//// making ISO string____________________________________________________________
// let date = Date()
// let formatter = DateFormatter()
// formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
// formatter.timeZone = TimeZone(secondsFromGMT: 0)
// formatter.locale = Locale(identifier: "en_US_POSIX")
// print("\(date), \(formatter.string(from: date))")
//
//var optional: String?
//if let o = optional {
//    print(o)
//} else {
//    print("o is nil")
//}
//
//for i in 1...10 {
//    print(i)
//}
//
//let dictArg: Dictionary = ["Joshua": "Dev", "Mattew": "PM", "Denis": "DevOps"]
//var emploeeStatuses: [String] = []
//for (_, val) in dictArg {
//    emploeeStatuses.append(val)
//}
//print("Team full of: \(emploeeStatuses)")
//
//// Inheritance _____________________________________________________________________
//class Human {
//    var name: String
//    var age: Int
//
//    func greeting(name: String) -> String{
//        return "Hi \(name)"
//    }
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//}
//
//var Max = Human(name: "Max", age: 20);
//
//Max.age
//Max.name
//Max.greeting(name: "Lola")
//
//class Employ: Human {
//    var position: String
//    var eyeColor: UIColor
//
//    override func greeting(name: String) -> String {
//        return "Hello \(name). My name is \(self.name)."
//    }
//
//    init(position: String) {
//        self.position = position
//        self.eyeColor = UIColor.green
//        super.init(name: "Bob", age: 34)
//    }
//}
//
//let Bob = Employ(position: "iOS Developer")
//Bob.position
//Bob.name
//Bob.age
//Bob.eyeColor
//Bob.greeting(name: "Colleagues")
//
//// Computed properties _____________________________________________________________
//class Vehicles {
//    var brands: [String: Int]
//
//    var countBrandsSpeed: Int {
//        get {
//            var sumSpeed = 0
//            for (_, speed) in brands {
//                sumSpeed = sumSpeed + speed
//            }
//            return sumSpeed
//        }
//        set(newSpeed) {
//            var newBrands: [String: Int] = Dictionary()
//
//            for (brand, _) in brands {
//                newBrands.updateValue(newSpeed/brands.count, forKey: brand)
//            }
//
//            brands = newBrands
//        }
//    }
//    init(brands: [String: Int]) {
//        self.brands = brands
//    }
//}
//
//var cars = Vehicles(brands: ["Alfa Romeo": 240, "BMW": 220, "Mercedes Benz": 230])
//cars.brands
//cars.countBrandsSpeed
//cars.countBrandsSpeed = 840
//cars.brands
//
//
//// Protocols/Delegates________________________________________________________________
//protocol GirlsProptocol {
//    var name: String {get set}
//    var age: Int {get set}
//
//    var delegate: SecretWatcherProtocol? {get set}
//
//    func greetBoy(name: String) -> String
//    func sendMessage(phone: String, message: String) -> Bool
//
//    init(name: String, age: Int)
//    init(name: String, age: Int, delegate: SecretWatcherProtocol?)
//}
//
//protocol SecretWatcherProtocol {
//    var messages: [String] {get set}
//
//    func saveMessage(message: String)
//}
//
//class SecretWatcher: SecretWatcherProtocol {
//    var messages: [String] = []
//
//    func saveMessage(message: String) {
//        messages.append(message)
//    }
//}
//
//class Girl: GirlsProptocol {
//    var name: String
//    var age: Int
//
//    var delegate: SecretWatcherProtocol?
//
//    func greetBoy(name: String) -> String {
//        return "Hi, \(name)"
//    }
//    func sendMessage(phone: String, message: String) -> Bool {
//        delegate?.saveMessage(message: message)
//        return true
//    }
//
//    required init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//    required init(name: String, age: Int, delegate: SecretWatcherProtocol?) {
//        self.name = name
//        self.age = age
//        self.delegate = delegate
//    }
//}
//
//let SecretWatcherDelegate = SecretWatcher()
//let Alice = Girl(name: "Alice", age: 20, delegate: SecretWatcherDelegate)
//
//Alice.sendMessage(phone: "+380978898645", message: "What's up?")
//Alice.sendMessage(phone: "+380679888754", message: "Hello, Bibi. How are you")
//Alice.sendMessage(phone: "+380688958285", message: "Hi, mom")
//
//SecretWatcherDelegate.messages
//
//// Error Handling________________________________________________________________
//enum divideErors: Error {
//    case divideZero
//    case divideMinus
//}
//
//func divide(i: Int, j: Int) throws -> Int {
//    if j == 0 {
//        throw divideErors.divideZero
//    }
//    if j < 0 {
//        throw divideErors.divideMinus
//    }
//    return i/j
//}
//
//try? divide(i: 15, j: 0)
//
//do {
//    try divide(i: 15, j: -1)
//} catch divideErors.divideMinus {
//    print("You've tried")
//} catch divideErors.divideZero {
//    print("You'v tried")
//}

//Type convertion__________________________________________________________________
//var someStr: String?
//var randomArray: [Any?] = ["Hello", 123, nil, someStr, "Giulietta"]
//
//var sumString: String = ""
//var sum: Int = 0
//var countNil: Int = 0
//
//for i in randomArray {
//    if i is String {
//        sumString.append(i as! String)
//    }
//    if i is Int {
//        sum = sum + (i as! Int)
//    }
//    if i == nil {
//        countNil += 1
//    }
//}
//
//print("""
//sumString: \(sumString)
//sum: \(sum)
//countNil: \(countNil)
//""")

//Static variables/methods__________________________________________________________
//class Simple {
//    static let singleton = Simple()
//    static var str = "Static string"
//
//    class func staticZen() -> String {
//        return "ZEN"
//    }
//}
//
//Simple.singleton
//Simple.str
//Simple.staticZen()


