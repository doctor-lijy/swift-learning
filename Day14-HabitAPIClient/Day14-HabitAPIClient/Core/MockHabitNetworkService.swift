//
//  MockHabitNetworkService.swift
//  Day14-HabitAPIClient
//

import Foundation

/// 模拟网络延迟 + JSON 解析（后台执行，非 MainActor）
final class MockHabitNetworkService: HabitFetching, @unchecked Sendable {

    private let delayNanoseconds: UInt64
    private let json: Data

    init(delaySeconds: TimeInterval = 0.35, json: Data? = nil) {
        self.delayNanoseconds = UInt64(delaySeconds * 1_000_000_000)
        self.json = json ?? HabitFixtures.defaultJSON
    }

    func fetchHabits() async throws -> [Habit] {
        try await Task.sleep(nanoseconds: delayNanoseconds)
        try Task.checkCancellation()
        return try decodeHabits(from: json)
    }
}

enum HabitFixtures {
    static let defaultJSON = """
    [
      {"id":"1","title":"晨跑 20 分钟","isDone":false,"createdAt":"2026-05-21T08:00:00Z"},
      {"id":"2","title":"阅读 Swift 30 分钟","isDone":true,"createdAt":"2026-05-20T22:00:00Z"},
      {"id":"3","title":"写 Day14 周项目","isDone":false,"createdAt":"2026-05-26T09:00:00Z"}
    ]
    """.data(using: .utf8) ?? Data()
}
