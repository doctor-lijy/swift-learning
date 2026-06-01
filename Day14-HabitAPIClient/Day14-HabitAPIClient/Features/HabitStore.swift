//
//  HabitStore.swift
//  Day14-HabitAPIClient
//

import Foundation

actor HabitStore {

    private var habitsById: [String: Habit] = [:]
    private(set) var lastChangedId: String?

    var allHabits: [Habit] {
        habitsById.values.sorted { $0.createdAt < $1.createdAt }
    }

    var count: Int { habitsById.count }

    func replaceAll(_ habits: [Habit]) {
        habitsById = Dictionary(uniqueKeysWithValues: habits.map { ($0.id, $0) })
        lastChangedId = nil
    }

    func habit(id: String) -> Habit? {
        habitsById[id]
    }

    func updateTitle(id: String, title: String) {
        guard var habit = habitsById[id] else { return }
        habit.updateTitle(title)
        habitsById[id] = habit
        lastChangedId = id
    }

    func toggleDone(id: String) throws {
        guard var habit = habitsById[id] else {
            throw AppError.habitNotFound(id: id)
        }
        habit.toggleDone()
        habitsById[id] = habit
        lastChangedId = id
    }

    nonisolated static let debugName = "HabitStore"
}
