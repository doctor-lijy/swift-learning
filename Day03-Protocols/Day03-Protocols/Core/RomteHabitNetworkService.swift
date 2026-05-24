//
//  RomteHabitNetworkService.swift
//  Day03-Protocols
//
//  Created by RD前端-dodo on 2026/5/24.
//

import Foundation

final class RomteHabitNetworkService: HabitFetching {
    private let baseUrl: URL
    
    init(baseUrl: URL = URL(string: "https://api.example.com")!) {
        self.baseUrl = baseUrl
    }
    
    func fecthHabits(completion: @escaping FetchHabitsCompletion) {
        completion(.failure(NetworkError.notImplemented))
    }
}

enum NetworkError: Error {
    case notImplemented
}
