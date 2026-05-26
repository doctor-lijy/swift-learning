//
//  HabitStore.swift
//  Day06-Properties
//
//  Created by RD前端-dodo on 2026/5/25.
//

import Foundation

final class HabitStore {
    
    private var habitsById: [String :Habit] = [:]
    
    var allHabits: [Habit] {
        habitsById.values.sorted {
            $0.createdAt < $1.createdAt
        }
    }
    
    var count: Int {
        habitsById.count
    }
    
    private(set) var lastChangedId: String? {
        didSet {
            print("[HabitStore] last changed:", lastChangedId ?? "none")
        }
    }
    
    func replaceAll(_ habits: [Habit]) {
        habitsById = Dictionary(uniqueKeysWithValues: habits.map({ habit in
            (habit.id, habit)
        }))
        lastChangedId = nil
    }
    
    func habit(id: String) -> Habit? {
        habitsById[id]
    }
    
    func updateTitle(id: String, title: String) {
        guard var habit = habitsById[id] else {return}
        habit.updateTitle(title)
        habitsById[id] = habit
        lastChangedId = id
    }
    
    func toggleDone(id: String) {
        guard var habit = habitsById[id] else {return}
        habit.toggleDone()
        habitsById[id] = habit
        lastChangedId = id
    }
    
}
