//
//  main.swift
//  Day09-Actor
//
//  Created by RD前端-dodo on 2026/5/26.
//

import Foundation

print("Hello, World!")

var globalHabits: [Habit] = [
    Habit(id: "1", title: "晨跑", isDone: false)
]
func simulateRate() async {
    await withTaskGroup { group in
        for i in 0..<100 {
            group.addTask {
                var copy = globalHabits
                try? await Task.sleep(nanoseconds: 10_000)
                if  !copy.isEmpty {
                    copy[0].toggleDone()
                    globalHabits = copy
                }
            }
        }
    }
    print("race end count:", globalHabits.count)
}

