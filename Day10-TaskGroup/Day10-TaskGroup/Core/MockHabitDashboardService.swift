//
//  MockHabitDashboardService.swift
//  Day10-TaskGroup
//
//  Created by RD前端-dodo on 2026/5/26.
//

import Foundation

final class MockHabitDashboardService: HabitDashboardFetching {
    private let decoder: JSONDecoder = {
        let d = JSONDecoder()
        d.dateDecodingStrategy = .iso8601
        return d
    }()
    
    func fetchTodayHabits() async throws -> [Habit] {
        try await Task.sleep(nanoseconds: 500_000_000)
        try Task.checkCancellation()
        return try decode(file: "today")
    }
    
    func fetchWeeklyStats() async throws -> WeeklyStats {
        try await Task.sleep(nanoseconds: 800_000_000)
        try Task.checkCancellation()
        return WeeklyStats(completedCount: 3, totalCount: 5)
    }
    
    func fetchRecommendations() async throws -> [Habit] {
        try await Task.sleep(nanoseconds: 300_000_000)
        try Task.checkCancellation()
        return try decode(file: "recommend")
    }
    
    private func decode(file: String) throws -> [Habit] {
        let json = """
            [{"id":"\(file)-1","title":"\(file) habit","isDone":false,"createdAt":"2026-05-21T08:00:00Z"}]
            """
        return try decoder.decode([Habit].self, from: Data(json.utf8))
    }
    
}
