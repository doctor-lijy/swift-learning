//
//  Day14Entry.swift
//  Day14-HabitAPIClient
//
//  Week 2 周项目 · 命令行 Habit API 客户端
//  注意：勿命名为 main.swift，会与 @main 冲突
//

import Foundation

@main
struct Day14HabitAPIClientApp {
    static func main() async {
        let ui = HabitConsoleUI()

        print("🎯 Day 14 · Habit API Client")
        print("   async/await + Codable + AppError + actor + @MainActor UI\n")

        await HabitAPIClient.runMockDemo(ui: ui)
        await HabitAPIClient.runJSONFileDemo(ui: ui)
        await HabitAPIClient.runFailureDemo(ui: ui)
        await HabitAPIClient.runBadJSONDemo(ui: ui)

        print("✅ Week 2 周项目运行完成")
    }
}
