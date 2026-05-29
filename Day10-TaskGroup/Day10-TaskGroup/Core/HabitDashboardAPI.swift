//
//  HabitDashboardAPI.swift
//  Day10-TaskGroup
//
//  Created by RD前端-dodo on 2026/5/26.
//

import Foundation

struct WeeklyStats: Codable, Sendable {
    let completedCount: Int
    let totalCount: Int
}
struct HabitDashboard: Sendable {
    let today: [Habit]
    let stats: WeeklyStats
    let recommendations: [Habit]
    
    var summaryLine: String {
        "今日\(today.count)条，完成\(stats.completedCount)/\(stats.totalCount)，推荐\(recommendations.count)条"
    }
    
}

protocol HabitDashboardFetching: AnyObject {
    func fetchTodayHabits() async throws -> [Habit]
    func fetchWeeklyStats() async throws -> WeeklyStats
    func fetchRecommendations() async throws -> [Habit]
}
