//
//  main.swift
//  Day1-Models
//
//  Created by RD前端-dodo on 2026/5/21.
//

import Foundation

struct WQuoteCoinItem {
    let coinId: String
    var coinName: String
    var stepSize: String
    var iconUrl: String
    
}

struct Habit: Codable, Identifiable {
    let id: String
    var title: String
    var isDone: Bool
    let createdAt: Date
}

let json = """
[
  {
    "id": "1",
    "title": "晨跑 20 分钟",
    "isDone": false,
    "createdAt": "2026-05-21T08:00:00Z"
  },
  {
    "id": "2",
    "title": "阅读 Swift 30 分钟",
    "isDone": true,
    "createdAt": "2026-05-20T22:00:00Z"
  }
]
""".data(using: .utf8)
print(json ?? "")

let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .iso8601

do {
    let habits = try decoder.decode([Habit].self, from: json!)
    for h in habits {
        print("\(h.id) | \(h.title) | \(h.isDone)")
    }
    
//    var a = habits[0]
//    var b = a
//    b.title = "xxx"
//    print(a.title)
//    print(b.title)
    
    let encoder = JSONEncoder()
    encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
    encoder.dateEncodingStrategy = .iso8601
    let data = try encoder.encode(habits)
    print(String(data: data, encoding: .utf8)!)
    
} catch {
    print("decode error:", error)
}


struct User: Codable {
    let name: String
    let age: Int
}
let user = User(name: "xxx", age: 18)
// 1. Initialize the encoder
let encoder = JSONEncoder()
do {
    // 2. Encode object to Data
    let jsonData = try encoder.encode(user)
    // 3. Convert Data to String
    if let jsonString = String(data: jsonData, encoding: .utf8) {
        print(jsonString)
    }
} catch {
    print(error)
}

let jsonSting = """
    {
    "name": "xxxx"
    "age": 18
    }
    """
guard let jsonData = jsonSting.data(using: .utf8) else {
    fatalError("error")
}
let decoder2 = JSONDecoder()
do {
    let user = try decoder2.decode(User.self, from: jsonData)
    print("\(user.name), \(user.age)")
} catch {
    print(error)
}

//struct Document {
//    var text: String
//}
//
//var myDoc = Document(text: "xxxxx")
//var friendDoc = myDoc
//friendDoc.text = "sssss"
//print(friendDoc.text)
//print(myDoc.text)

//class Document {
//    var text: String
//    init(text: String) {
//        self.text = text
//    }
//}
//var myDoc = Document(text: "xxxxx")
//var friendDoc = myDoc
//friendDoc.text = "sssss"
//print(friendDoc.text)
//print(myDoc.text)
