//
//  Habit.swift
//  Day14-HabitAPIClient
//
//  Week 2 周项目 · 完整习惯模型
//

import Foundation

struct Habit: Identifiable, Equatable, Sendable {
    let id: String
    private(set) var title: String
    private(set) var isDone: Bool
    let createdAt: Date

    init(
        id: String,
        title: String,
        isDone: Bool = false,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.title = title
        self.isDone = isDone
        self.createdAt = createdAt
    }

    mutating func updateTitle(_ newTitle: String) {
        let trimmed = newTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        title = trimmed
    }

    mutating func toggleDone() {
        isDone.toggle()
    }
}

extension Habit: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case isDone
        case createdAt
    }
}
