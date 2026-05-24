//
//  main.swift
//  Day04-Errors
//
//  Created by RD前端-dodo on 2026/5/24.
//

import Foundation


//let badJson = Data("invalid json".utf8)
//let brokenMock = MockHabitNetworkService(json: badJson)

runDemo(network: MockHabitNetworkService())
runDemo(network: FailingMockHabitNetworkService(error: .networkUnavailable))
runDemo(network: MockHabitNetworkService(json: Data("{".utf8)))

func runDemo(network: HabitFetching) {
    let repo = HabitRepository(network: network)
    repo.onHabitsUpdated = {print("✅", $0.map(\.title))}
    repo.onError = {print("❌", $0.userMessage, "|", $0.debugDescription)}
    repo.refresh()
    Thread.sleep(forTimeInterval: 1)
}
