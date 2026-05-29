//
//  CombinedPipelineExample.swift
//  Day10-AsyncTask
//
//  Created by RD前端-dodo on 2026/5/28.
//

import Foundation

enum CombinedPipelineExample {
    actor ResultCache {
        private var  modules: [DashboardLoader.Module] = []
        func save(_ items: [DashboardLoader.Module]) {
            modules = items
        }
        func snapshot() -> [DashboardLoader.Module] {
            modules
        }
        
    }
    
    static func refresh() async {
        let cache = ResultCache()
        Task {
            do {
                let modules = try await DashboardLoader.loadAll()
                await cache.save(modules)
                let snap = await cache.snapshot()
                await MainActor.run {
                    print("主线程刷新UI，模块数：\(snap.count)")
                }
            } catch {
                await MainActor.run {
                    print("\(error)")
                }
            }
            
        }
    }
    
}
