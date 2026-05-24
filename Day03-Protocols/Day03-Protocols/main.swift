//
//  main.swift
//  Day03-Protocols
//
//  Created by RD前端-dodo on 2026/5/22.
//

import Foundation

//protocol Togglable {
//     mutating func toggle()
//}
//
//enum OnOffSwitch: Togglable {
//    
//    case on, off
//    mutating func toggle() {
//        switch self {
//        case .on:
//            self = .off
//        case .off:
//            self = .on
//        }
//    }
//}
//
//var lightSwitch = OnOffSwitch.off
//lightSwitch.toggle()
//print(lightSwitch)

let mockNetwork = MockHabitNetworkService(delay: 0.2)
let repo = HabitRepository(network: mockNetwork)
repo.onHabitsUpdated = { habits in
    print("UI update", habits.map(\.title))
}
repo.refresh()


let encoder =  JSONEncoder()
encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
encoder.dateEncodingStrategy = .iso8601
