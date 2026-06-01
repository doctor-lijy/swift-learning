//
//  HabitConsoleUI.swift
//  Day14-HabitAPIClient
//
//  CLI 模拟「主线程更新 UI」— 所有展示逻辑标 @MainActor
//

import Foundation

@MainActor
final class HabitConsoleUI {

    func showLoading() {
        assert(Thread.isMainThread)
        print("⏳ [UI] 加载中…")
    }

    func showHabits(_ habits: [Habit]) {
        assert(Thread.isMainThread)
        print("\n📋 [UI] 习惯列表（\(habits.count) 条）")
        for habit in habits {
            let mark = habit.isDone ? "✓" : "○"
            print("  \(mark) \(habit.id) · \(habit.title)")
        }
        print()
    }

    func showError(_ error: AppError) {
        assert(Thread.isMainThread)
        print("❌ [UI] \(error.userMessage)  (\(error.debugDescription))")
    }

    func showMessage(_ message: String) {
        assert(Thread.isMainThread)
        print("ℹ️ [UI] \(message)")
    }
}
