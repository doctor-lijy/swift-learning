//
//  NetworkService.swift
//  Day03-Protocols
//
//  Created by RD前端-dodo on 2026/5/22.
//

import Foundation

typealias FetchHabitsCompletion = (Result<[Habit], Error>) -> Void

protocol HabitFetching: AnyObject {
    func fecthHabits(completion:@escaping FetchHabitsCompletion)
}

extension HabitFetching {
    func makeDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
    
    func decodeHabits(from data:Data) throws -> [Habit] {
        try makeDecoder().decode([Habit].self, from: data)
    }
}
