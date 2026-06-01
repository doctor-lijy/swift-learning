//
//  FailingMockHabitNetworkService.swift
//  Day14-HabitAPIClient
//

import Foundation

final class FailingMockHabitNetworkService: HabitFetching, @unchecked Sendable {

    private let error: AppError

    init(error: AppError = .networkUnavailable) {
        self.error = error
    }

    func fetchHabits() async throws -> [Habit] {
        try await Task.sleep(nanoseconds: 100_000_000)
        throw error
    }
}
