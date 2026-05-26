//
//  Habit.swift
//  Day03-Protocols
//
//  Created by RD前端-dodo on 2026/5/22.
//

import Foundation

struct Habit {
    let id: String
    private(set) var title: String
    private(set) var isDone: Bool
    let createdAt: Date
    
//    enum Codingkeys: String, CodingKey {
//        case id
//        case title
//        case isDone = "done"
//        case createdAt = "created_at"
//    }
    
    init(id: String, title: String, isDone: Bool = false, createdAt: Date = Date()) {
        self.id = id
        self.title = title
        self.isDone = isDone
        self.createdAt = createdAt
    }
    
    mutating func updateTitle(_ newTitle: String) -> Void {
        let trimmed = newTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {return}
        title = trimmed
    }
    
    mutating func toggleDone() {
        isDone.toggle()
    }
    
}

extension Habit : Codable {
    fileprivate enum Codingkeys: String, CodingKey {
        case id, title
        case isDone = "done"
        case createdAt = "created_at"
    }
}
