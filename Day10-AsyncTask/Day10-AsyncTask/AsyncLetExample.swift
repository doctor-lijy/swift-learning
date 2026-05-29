//
//  AsyncLetExample.swift
//  Day10-AsyncTask
//
//  Created by RD前端-dodo on 2026/5/28.
//

import Foundation


enum AsyncLetExample {
    static func loadPair() async -> (String, Int) {
        async let userName = fecthUserName()
        async let orderCount = fecthOrderCount()
        return await (userName, orderCount)
    }
    
    private static func fecthUserName() async -> String {
        try? await Task.sleep(nanoseconds: 30_000_000)
        return "luoyu"
    }
    
    private static func fecthOrderCount() async -> Int {
        try? await Task.sleep(nanoseconds: 10_000_000)
        return 3
    }
    
}
