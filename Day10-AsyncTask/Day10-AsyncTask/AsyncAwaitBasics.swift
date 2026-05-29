//
//  AsyncAwaitBasics.swift
//  Day10-AsyncTask
//
//  Created by RD前端-dodo on 2026/5/28.
//

import Foundation

enum AsyncAwaitBasics {
    static func fetchTitlle() async -> String {
        try? await Task.sleep(nanoseconds: 30_000_000)
        return "文章标题"
    }
    
    static func fetchTitleOrThrow() async throws -> String {
        try await Task.sleep(nanoseconds: 30_000_000)
        if Bool.random() {
            return "文章标题"
        }
        throw LoadError.timeout
    }
    
    enum LoadError: Error {
        case timeout
    }
    
    static func loadSequential() async -> (String, Int) {
        let tile = await fetchTitlle()
        let count = await fetchCount()
        return (tile, count)
    }
    
    private static func fetchCount() async -> Int {
        try? await Task.sleep(nanoseconds: 30_000_000)
        return 42
    }
    
    static func loadAndPrint() async {
        let title = await fetchTitlle()
        print("title:\(title)")
    }
    
    static func entryFromSyncWorld() {
        Task {
            await loadAndPrint()
        }
    }
    
}

enum AwaitSuspendsionDemo {
    static func demo() async {
        print("1")
        try? await Task.sleep(nanoseconds: 50_000_000)
        print("2")
        let value = await AsyncAwaitBasics.fetchTitlle()
        print("3:\(value)")
    }
}

enum AsyncThrowsDemo {
    static func loadWithRetry(maxAttempts: Int) async -> String? {
        for attempt in 1...maxAttempts {
            do {
                return try await AsyncAwaitBasics.fetchTitleOrThrow()
            } catch {
                print("\(error)")
            }
            
        }
        return nil
    }
}
