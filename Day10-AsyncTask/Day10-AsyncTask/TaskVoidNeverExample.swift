//
//  TaskVoidNeverExample.swift
//  Day10-AsyncTask
//
//  Created by RD前端-dodo on 2026/5/28.
//

import Foundation


struct TaskVoidNeverExample {
    
    let task1 : Task<String, Error> = Task {
        let data = try await fetchData()
        return data
    }
    
    private static func fetchData() async -> String {
        try? await Task.sleep(nanoseconds: 10_000_000)
        return "load"
    }
    
    let task2: Task<Int, Never> = Task {
        return 42
    }
    
    let task3: Task<Void, Never> = Task {
        await doSomething()
    }
    
    let task4: Task<Void, Error> = Task {
        try await saveData()
    }
    
}

