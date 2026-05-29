//
//  HabitDashboardLoader.swift
//  Day10-TaskGroup
//
//  Created by RD前端-dodo on 2026/5/26.
//

import Foundation


final class HabitDashboardLoader {
    private let api: HabitDashboardFetching
    
    init(api: HabitDashboardFetching) {
        self.api = api
    }
    
    func loadSerial() async throws -> HabitDashboard {
        let today = try await api.fetchTodayHabits()
        let stats = try await api.fetchWeeklyStats()
        let recommendation = try await api.fetchRecommendations()
        return HabitDashboard(today: today, stats: stats, recommendations: recommendation)
    }
    
    func loadParallel() async throws -> HabitDashboard {
        try await withThrowingTaskGroup(of: Partail.self) { group in
            group.addTask {
                .today(try await self.api.fetchTodayHabits())
            }
            group.addTask {
                .stats(try await self.api.fetchWeeklyStats())
            }
            group.addTask {
                .recommendation(try await self.api.fetchRecommendations())
            }
            
            var  today: [Habit] = []
            var stats = WeeklyStats(completedCount: 0, totalCount: 0)
            var recommendations: [Habit] = []
            
            for try await part in group {
                switch part {
                case .today(let value): today = value
                case .stats(let value): stats = value
                case .recommendation(let value): recommendations = value
                }
            }
            
       return HabitDashboard(today: today, stats: stats, recommendations: recommendations)
        }
    }
    
    private enum Partail {
        case today([Habit])
        case stats(WeeklyStats)
        case recommendation([Habit])
    }
    
}
