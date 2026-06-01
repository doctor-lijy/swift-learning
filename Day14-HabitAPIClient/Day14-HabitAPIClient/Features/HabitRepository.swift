//
//  HabitRepository.swift
//  Day14-HabitAPIClient
//
//  网络（后台 async）→ actor Store → MainActor UI
//

import Foundation

final class HabitRepository: @unchecked Sendable {

    private let network: any HabitFetching
    private let store = HabitStore()
    private let ui: HabitConsoleUI

    init(network: any HabitFetching, ui: HabitConsoleUI) {
        self.network = network
        self.ui = ui
    }

    /// 拉取列表并刷新 UI
    func refresh() async {
        await ui.showLoading()
        do {
            let habits = try await network.fetchHabits()
            await store.replaceAll(habits)
            let snapshot = await store.allHabits
            await ui.showHabits(snapshot)
        } catch {
            await ui.showError(AppError.map(error))
        }
    }

    /// 切换完成状态
    func toggle(habitId: String) async {
        do {
            try await store.toggleDone(id: habitId)
            let snapshot = await store.allHabits
            await ui.showMessage("已切换习惯 \(habitId)")
            await ui.showHabits(snapshot)
        } catch {
            await ui.showError(AppError.map(error))
        }
    }

    func habitCount() async -> Int {
        await store.count
    }
}
