//
//  main.swift
//  Day06-Properties
//
//  Created by RD前端-dodo on 2026/5/25.
//

import Foundation


final class TitleValiddator {
    var title: String = "" {
        didSet {
            if title.count > 5 {
                title.append("cccc")
            }
            print("newValue:\(title)")
        } willSet {
            print("will set title:", newValue)
        }
    }
}
var titleValid = TitleValiddator()
titleValid.title = "dddddddd"
titleValid.title = "aaaabnbn"


//@propertyWrapper
//struct TwelveOrLess {
//    private var number = 0
//    var  wrappedValue: Int {
//        get {
//            number
//        } set {
//            number = min(newValue, 12)
//        }
//    }
//}
//struct SmallRectangle {
//    @TwelveOrLess var height: Int
//    @TwelveOrLess var width: Int
//}
//
//var rectangle = SmallRectangle()
//print(rectangle.width, rectangle.height)
//rectangle.height = 111
//print(rectangle.height)
//rectangle.height = 8
//print(rectangle.height)

//struct FixedLengthRange {
//    var firstValue: Int
//    let length: Int
//}
//
//var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
//rangeOfThreeItems.firstValue = 2
//
//class DataImporter {
//    var fileName = "Data text"
//}
//
//class DataManager {
//    lazy var importer = DataImporter()
//    var data: [ String]  = []
//}
//let manager = DataManager()
//manager.data.append("some data")
//manager.data.append("some more data")
//print(manager.importer.fileName)
//
//
//struct Point {
//    var x = 0.0
//    var y = 0.0
//}
//struct Size {
//    var width = 0.0
//    var height = 0.0
//}
//struct Rect {
//    var origin = Point()
//    var size = Size()
//    var center: Point {
//        get {
//            let centerX = origin.x + size.width / 2
//            let centerY = origin.y + size.height / 2
//            return Point(x: centerX, y: centerY)
//        } set(newValue) {
//            origin.x = newValue.x - size.width / 2
//            origin.y = newValue.y - size.height / 2
//        }
//    }
//}
//var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
//let squareCenter = square.center
//print(squareCenter)
//square.center = Point(x: 15, y: 15)
//print(square.origin)
//
//struct Cuboid {
//    var width = 0.0, height = 0.0, depth = 0.0
//    var volume: Double {
//        width * height * depth
//    }
//}
//
//class StepCounter {
//    var totalSteps: Int = 0 {
//        willSet {
//            print(newValue)
//        } didSet {
//            if totalSteps > oldValue {
//                print("totalSteps-oldValue", totalSteps - oldValue)
//            }
//        }
//    }
//}
//var stepCounter = StepCounter()
//stepCounter.totalSteps = 100
//stepCounter.totalSteps = 102
