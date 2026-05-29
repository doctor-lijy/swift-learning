//
//  ActorExample.swift
//  Day10-AsyncTask
//
//  Created by RD前端-dodo on 2026/5/28.
//

import Foundation


actor SessionStore {
    private(set) var token: String?
    private var profileName: String?
    
    func login(token: String, name: String) {
        self.token = token
        profileName = name
    }
    
    func logout() {
        token = nil
        profileName = nil
    }
    
    func displayName() -> String {
        profileName ?? "未登录"
    }
    
}


enum ActorConcurrentAccessExample {
    static func demo() async {
        let store = SessionStore()
        await withTaskGroup { group in
            group.addTask {
                await store.login(token: "1", name: "112")
            }
            group.addTask {
                await store.login(token: "2", name: "223")
            }
        }
        print("\(await store.displayName())")
        print("\(await store.token ?? "nil")")
    }
    
}
