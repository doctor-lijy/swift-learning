//
//  Habit.swift
//  Day03-Protocols
//
//  Created by RD前端-dodo on 2026/5/22.
//

import Foundation

struct Habit: Codable, Identifiable {
    let id: String
    var title: String
    var isDone: Bool
    var createdAt: Date
    
    enum Codingkeys: String, CodingKey {
        case id
        case title
        case isDone = "done"
        case createdAt = "created_at"
    }
}

