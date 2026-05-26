//
//  main.swift
//  Day08-Async
//
//  Created by RD前端-dodo on 2026/5/26.
//

import Foundation

print("Hello, World!")


struct Day08App {
    static func main() async {
        let network = MockHabitNetworkService(delaySeconds: 0.5)
        let repo = HabitRepository(network: network)
        
        repo.onHabitsUpdated = {
            print($0.map(\.title))
        }
        repo.onError = {
            print($0.userMessage)
        }
        await repo.refeshAsynx()
    }
}
