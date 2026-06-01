//
//  NetworkService.swift
//  Day14-HabitAPIClient
//

import Foundation

/// 习惯列表 API（async + Sendable，可在 Task / actor 间传递）
protocol HabitFetching: AnyObject, Sendable {
    func fetchHabits() async throws -> [Habit]
}

extension HabitFetching {
    func makeDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }

    func decodeHabits(from data: Data) throws -> [Habit] {
        guard !data.isEmpty else { throw AppError.emptyData }
        return try makeDecoder().decode([Habit].self, from: data)
    }
}
