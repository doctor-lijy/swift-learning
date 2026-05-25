//
//  MockHabitNetworkService.swift
//  Day03-Protocols
//
//  Created by RD前端-dodo on 2026/5/22.
//

import Foundation

final  class MockHabitNetworkService: HabitFetching {
    
    private let delay: TimeInterval
    private let json: Data
    
    init(delay: TimeInterval = 0.2, json: Data? = nil) {
        self.delay = delay
        self.json = json ?? Self.defaultJson
    }
    
    func fecthHabits(completion: @escaping FetchHabitsCompletion) {
        DispatchQueue.global().asyncAfter(deadline: .now() + delay) {
            [weak self] in
            guard let self else {return}
            do {
                let habits = try self.decodeHabits(from: self.json)
                completion(.success(habits))
            } catch {
                completion(.failure(AppError.map(error)))
            }
        }
    }
    
    private static let defaultJson = """
        [
        {"id":"1","title":"晨跑","isDone":false,"createdAt":"2026-05-21T08:00:00Z"},
              {"id":"2","title":"阅读 Swift","isDone":true,"createdAt":"2026-05-20T22:00:00Z"}
            ]
        """.data(using: .utf8)!
    
}
