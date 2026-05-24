//
//  HabitListController.swift
//  Day03-Protocols
//
//  Created by RD前端-dodo on 2026/5/24.
//

import Foundation

final class HabitListController {
    private let network: HabitFetching
    
    init(network: HabitFetching) {
        self.network = network
    }
    func load() {
        network.fecthHabits { [weak  self] result in
            self?.handle(result)
        }
    }
}

private extension HabitListController {
    func handle(_ result: Result<[Habit], Error>) {
        switch result {
        case .success(let habits):
            print("loaded:", habits.count)
        case .failure(let error):
            print("error:", error)
        }
    }
}
