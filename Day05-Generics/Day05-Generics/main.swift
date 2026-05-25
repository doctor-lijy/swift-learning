//
//  main.swift
//  Day05-Generics
//
//  Created by RD前端-dodo on 2026/5/24.
//

import Foundation

let habitCode = Cache<String, Habit>()


//let habits: [Habit] = [Habit(id: "11111111", title: "111", isDone: true, createdAt: Date(timeIntervalSinceNow: 111)),
//Habit(id: "2222222", title: "222", isDone: false, createdAt: Date(timeIntervalSinceNow: 222))]
//
//let titles = habits.map { $0.title}
//let titles2 = habits.map(\.title)
//
//let undone = habits.filter { !$0.isDone
//}
//print(undone)
//
//let doneCount = habits.reduce(0) { partialResult, habit in
//    habit.isDone ? partialResult + 1 : partialResult
//}
//print(doneCount)
//
//let undoneTitles = habits.filter{$0.isDone}
//    .map(\.title)
//    .joined(separator: ",  ,")
//print(undoneTitles)

//protocol Container {
//    associatedtype Item
//    mutating func append(_ item: Item)
//    var count: Int {get}
//    subscript(i: Int) -> Item {get}
//}
//
//struct Stack<Element>: Container {
//    
//    mutating func append(_ item: Element) {
//        items.append(item)
//    }
//    
//    subscript(i: Int) -> Element {
//        return items[i]
//    }
//    
//    typealias Item = Element
//    
//    var count: Int
//    var items: [Element] = []
//    
//    
//}
//
