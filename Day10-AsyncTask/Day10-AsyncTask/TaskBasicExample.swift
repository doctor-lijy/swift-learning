//
//  TaskBasicExample.swift
//  Day10-AsyncTask
//
//  Created by RD前端-dodo on 2026/5/28.
//

import Foundation


enum TaskBasicExample {
    static func startFromSyncContext() {
        Task {
            let value = await fetchRemoteFlag()
            print("Task 完成：\(value)")
        }
    }
    
    static func fetchRemoteFlag() async -> String {
        try? await Task.sleep(nanoseconds: 50_000_00)
        return "ok"
    }
    
}


final class CancellabelWork {
    private var loadTask: Task<Void, Never>?
    
    func start() {
        loadTask?.cancel()
        
        loadTask = Task {
            for i in 1...5 {
                if Task.isCancelled {
                    return
                }
                try? await Task.sleep(nanoseconds: 10_000_000)
            }
        }
        print("结束")
    }
    
    func cancel() {
        loadTask?.cancel()
        loadTask = nil
    }
    
}

enum TaskPriorityExample {
    static func run() {
        Task(priority: .utility) {
            await heavyWork()
        }
    }
    
    static func heavyWork() async {
        try? await Task.sleep(nanoseconds: 10_000_000)
        print("低优先级后台任务完成")
    }
    
}
