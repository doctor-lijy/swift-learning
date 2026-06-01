//
//  JSONHabitAPIClient.swift
//  Day14-HabitAPIClient
//
//  从磁盘 JSON 模拟 API（Codable + async）
//

import Foundation

final class JSONHabitAPIClient: HabitFetching, @unchecked Sendable {

    private let fileURL: URL
    private let delayNanoseconds: UInt64

    init(fileURL: URL, delaySeconds: TimeInterval = 0.15) {
        self.fileURL = fileURL
        self.delayNanoseconds = UInt64(delaySeconds * 1_000_000_000)
    }

    func fetchHabits() async throws -> [Habit] {
        try await Task.sleep(nanoseconds: delayNanoseconds)
        let data: Data
        do {
            data = try Data(contentsOf: fileURL)
        } catch {
            throw AppError.networkUnavailable
        }
        return try decodeHabits(from: data)
    }
}
