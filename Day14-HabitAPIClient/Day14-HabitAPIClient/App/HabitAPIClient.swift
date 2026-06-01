//
//  HabitAPIClient.swift
//  Day14-HabitAPIClient
//
//  Week 2 周项目入口：串联 Mock / JSON / 失败场景
//

import Foundation

enum HabitAPIClient {

    /// 场景 1：Mock 网络
    static func runMockDemo(ui: HabitConsoleUI) async {
        print("\n========== 场景 1：Mock API ==========")
        let repo = HabitRepository(network: MockHabitNetworkService(), ui: ui)
        await repo.refresh()
        await repo.toggle(habitId: "1")
    }

    /// 场景 2：本地 JSON 文件（Codable）
    static func runJSONFileDemo(ui: HabitConsoleUI) async {
        print("\n========== 场景 2：JSON 文件 API ==========")
        guard let url = HabitJSONResource.habitsFileURL else {
            await ui.showError(.invalidResponse)
            return
        }
        let client = JSONHabitAPIClient(fileURL: url)
        let repo = HabitRepository(network: client, ui: ui)
        await repo.refresh()
    }

    /// 场景 3：错误处理
    static func runFailureDemo(ui: HabitConsoleUI) async {
        print("\n========== 场景 3：网络失败 ==========")
        let repo = HabitRepository(
            network: FailingMockHabitNetworkService(error: .networkUnavailable),
            ui: ui
        )
        await repo.refresh()
    }

    /// 场景 4：坏 JSON → decodingFailed
    static func runBadJSONDemo(ui: HabitConsoleUI) async {
        print("\n========== 场景 4：解析失败 ==========")
        let bad = Data("{ not json".utf8)
        let repo = HabitRepository(network: MockHabitNetworkService(json: bad), ui: ui)
        await repo.refresh()
    }
}

enum HabitJSONResource {
    /// 相对源码目录定位 habits.json（CLI / Xcode Run 均可用）
    static var habitsFileURL: URL? {
        let file = URL(fileURLWithPath: #filePath) // .../App/HabitAPIClient.swift
        let resources = file
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .appendingPathComponent("Resources/habits.json")
        return FileManager.default.fileExists(atPath: resources.path) ? resources : nil
    }
}
