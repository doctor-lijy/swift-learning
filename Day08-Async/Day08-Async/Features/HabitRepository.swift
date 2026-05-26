//
//  HabitRepository.swift
//  Day03-Protocols
//
//  Created by RD前端-dodo on 2026/5/24.
//

import Foundation

final class HabitRepository {
    private let network: HabitFetching
    private let store = HabitStore()
    
    var stores: HabitStore { store }
    
    var onHabitsUpdated: (([Habit]) -> Void)?
    var onError:((AppError) -> Void)?
    
    private lazy var logDateFormatter: DateFormatter = {
        let f  = DateFormatter()
        f.dateStyle = .short
        f.timeStyle = .medium
        return f
    }()
    
    init(network: HabitFetching) {
        self.network = network
    }
    
    func refresh() {
        network.fecthHabits { [weak self] result in
            guard let self else {return}
//            if case .success(let habits) = result {
//                self.cached = habits
//                self.onHabitsUpdated?(habits)
//            }
            switch result {
            case .success(let habits):
                self.stores.replaceAll(habits)
                self.logRefresh(count: habits.count)
                self.onHabitsUpdated?(self.stores.allHabits)
            case .failure(let error):
                self.onError?(error)
                
            }
            
        }
    }
    
    func refeshAsynx() async {
        do {
            let habits = try await network.fecthHabits()
            stores.replaceAll(habits)
            onHabitsUpdated?(stores.allHabits)
        } catch {
            onError?(AppError.map(error))
        }
    }
    
    private func logRefresh(count: Int) {
        print("[Repo refreshed] \(count) at", logDateFormatter.string(from: Date()))
    }
    
}
