//
//  Habit.swift
//  Day15-UIKitShell
//
//  Created by RD前端-dodo on 2026/6/1.
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
    
    static let sampleList: [Habit] = [
        Habit(id: "1", title: "晨跑", isDone: false, createdAt: .now),
                Habit(id: "2", title: "阅读 Swift 并整理 Day16 SnapKit 自适应高度与 Safe Area 语义色练习", isDone: true, createdAt: .now),
                Habit(id: "3", title: "冥想", isDone: false, createdAt: .now),
    ]
    
}

