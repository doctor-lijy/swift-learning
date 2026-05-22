//
//  main.swift
//  Day2-Closures
//
//  Created by RD前端-dodo on 2026/5/21.
//

import Foundation


struct Habit: Codable, Identifiable {
    let id: String
    var title: String
    var isDone: Bool
    var createdAt: Date
}
typealias FetchHabitsCompletion = (Result<[Habit], Error>) -> Void
final class HabitService {
    func fetchHabits(completion: @escaping FetchHabitsCompletion) {
        DispatchQueue.global().asyncAfter(deadline: .now()+0.5) {
            let json = """
                [{"id":"1","title":"晨跑","isDone":false,"createdAt":"2026-05-21T08:00:00Z"}]
                """.data(using: .utf8)!
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let habit = try decoder.decode([Habit].self, from: json)
                completion(.success(habit))
            } catch {
                completion(.failure(error))
            }
        }
    }
}

final class HabitListController {
    private let service = HabitService()
    
    final func load() {
        service.fetchHabits(completion: {result in
            switch result {
            case .success(let habits):
                print(habits.count)
            case .failure(let error):
                print(error)
            }
        })
//        service.fetchHabits { result in
//            if case .success(let habits) = result {
//                print(habits.map(\.title))
//            }
//            if case .failure(let error) = result {
//                print(error)
//            }
//        }
        
    }
    
}

HabitListController().load()

final class HabitRepository {
    private var cached: [Habit] = []
    var onHabitsUpdated: (([Habit]) -> Void)?
    
    func refresh(service: HabitService) {
        service.fetchHabits { [weak self] result in
            guard let self else {return}
            if case .success(let habits) = result {
                self.cached = habits
                self.onHabitsUpdated?(habits)
            }
        }
    }
}

final class HabitListVC {
    let service = HabitService()
    var habits: [Habit] = []
    
    func viewDidLoad() {
        service .fetchHabits {[weak self] result in
            guard let self else {return}
            if case .success(let list) = result {
                self.habits = list
                self.reload()
            }
        }
    }
    
    func reload() {
        print("reload", habits.count)
    }
}

final class HabitRefrshManager {
    var onRefresh: (() -> Void)?
    
    func scheduleRefresh() {
    
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: DispatchWorkItem(block: {
            [weak self] in
            self?.onRefresh?()
        }))
        
    }
    
    func bind(to vc: HabitListVC) {
        onRefresh = {[weak vc] in vc?.reload()}
    }
}

final class HabitDetailLoader {
    let service = HabitService()
    
    func loadDetail(habitId: String, done:@escaping (Habit?) -> Void) {
        service .fetchHabits { [weak self] result in
            guard let self else {return}
            guard case .success(let list) = result,
                  let habit = list.first(where: { $0.id == habitId
                  }) else {
                done(nil)
                return
            }
            DispatchQueue.global().asyncAfter(deadline: .now()+0.3, execute: DispatchWorkItem(block: {
                [weak self] in
                guard let self else {return}
                done(habit)
            }))
        }
    }
}

//let digitNames = [
//    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
//    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
//]
//let numbers = [16, 58, 510]
//
//let strings = numbers.map { (number) -> String in
//    var number = number
//    var output = ""
//    repeat {
//        output = digitNames[number % 10]! + output
//        number /= 10
//    } while number > 0
//     return output
//}
//print(strings)
//
//func makeIncrementer(forIncrment amount: Int) -> () -> Int {
//    var runningTotal = 0
//    func incrementer() -> Int {
//        runningTotal += amount
//        return runningTotal
//    }
//    return incrementer
//}
//let incrementByFour = makeIncrementer(forIncrment: 4)
//print(incrementByFour())
//print(incrementByFour())
//print(incrementByFour())
//
//var completionHandlers: [() -> Void] = []
//func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
//    completionHandlers.append(completionHandler)
//}
//func someFunctionWithNonescapingClosure(closure: () -> Void) {
//    closure()
//}
//class SomeClass {
//    var x = 10
//    func doSomething() {
//        someFunctionWithEscapingClosure {
//            self.x = 100
//        }
//        someFunctionWithNonescapingClosure {
//            x = 200
//        }
//    }
//}
//let instance = SomeClass()
//instance.doSomething()
//print(instance.x)
//completionHandlers.first!()
//print(instance.x)
