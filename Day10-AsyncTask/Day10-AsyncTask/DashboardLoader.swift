//
//  DashboardLoader.swift
//  Day10-AsyncTask
//
//  Created by RD前端-dodo on 2026/5/28.
//

import Foundation


enum DashboardLoader {
    struct Module: Sendable {
        let name: String
        let payload: String
    }
    
    static func loadAll() async throws -> [Module] {
        try await withThrowingTaskGroup(of: Module.self) { group in
            group.addTask {
                try await loadMoudle("1")
            }
            group.addTask {
                try await loadMoudle("2")
            }
            group.addTask {
                try await loadMoudle("3")
            }
            var result:[Module] = []
            for try await module in group {
                result.append(module)
            }
            return result
        }
    }
    
    private static func loadMoudle(_ name: String) async throws -> Module {
        try await Task.sleep(nanoseconds: UInt64.random(in: 20...80) * 1_000_000)
        return Module(name: name, payload: "\(name)-data")
    }
    
}


enum TaskGroupBatchExample {
    static func fetchSummaries(ids: [Int]) async -> [String] {
        await withTaskGroup(of: (Int, String).self) { group in
            for id in ids {
                group .addTask {
                    let summary = await mockFetch(id: id)
                    return (id, summary)
                }
            }
            var map: [Int: String] = [:]
            for await (id, summary) in group {
                map[id] = summary
            }
            return ids.compactMap { map[$0]
            }
        }
    }
    
    private static func mockFetch(id: Int) async -> String {
        try? await Task.sleep(nanoseconds: 20_000_000)
        return "item-\(id)"
    }
    
}
