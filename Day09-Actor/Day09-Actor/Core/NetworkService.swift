//
//  NetworkService.swift
//  Day03-Protocols
//
//  Created by RD前端-dodo on 2026/5/22.
//

import Foundation

typealias FetchHabitsCompletion = (Result<[Habit], AppError>) -> Void

protocol HabitFetching: AnyObject {

    func fecthHabits(completion:@escaping FetchHabitsCompletion)
    
    func fecthHabits() async throws -> [Habit]
}

extension HabitFetching {
    func makeDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
    
    func decodeHabits(from data:Data) throws -> [Habit] {
        guard !data.isEmpty else {throw AppError.emptyData}
        return try makeDecoder().decode([Habit].self, from: data)
    }
    
    func fecthHabits(completion: @escaping (Result<[Habit], AppError>) -> Void)  {
        Task {
            do {
                let habits = try await fecthHabits()
                completion(.success(habits))
            } catch {
                completion(.failure(AppError.map(error)))
            }
        }
        
    }
    
}
