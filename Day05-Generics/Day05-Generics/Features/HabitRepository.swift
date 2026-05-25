//
//  HabitRepository.swift
//  Day03-Protocols
//
//  Created by RD前端-dodo on 2026/5/24.
//

import Foundation

final class HabitRepository {
    private let network: HabitFetching
    private(set) var cached: [Habit] = []
    var onHabitsUpdated: (([Habit]) -> Void)?
    var onError:((AppError) -> Void)?
    
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
                self.cached = habits
                self.onHabitsUpdated?(habits)
            case .failure(let error):
                self.onError?(error)
                
            }
            
        }
    }
    
}
