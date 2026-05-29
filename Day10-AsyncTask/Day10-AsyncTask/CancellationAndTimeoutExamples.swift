//
//  CancellationAndTimeoutExamples.swift
//  Day10-AsyncTask
//
//  Created by RD前端-dodo on 2026/5/29.
//

import Foundation

enum CancellationAndTimeoutExamples {
    enum TimesoutError: Error {
        case timeOut
    }
    static func cancelllabelLoopWork() async {
        for step in  1...10 {
            if Task.isCancelled {
                print("\(step)")
                return
            }
            try? await Task.sleep(nanoseconds: 40_000_000)
        }
        print("wancheng")
    }
    
    static func withTimeout<T: Sendable>(seconds: TimeInterval, operation:@escaping @Sendable () async throws -> T) async throws -> T {
        try await withThrowingTaskGroup(of: T.self) { group in
            group.addTask {
                try await operation()
            }
            group.addTask {
                try await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000))
                throw TimesoutError.timeOut
            }
            let first = try await group.next()!
            group.cancelAll()
            return first
        }
    }
    
}
