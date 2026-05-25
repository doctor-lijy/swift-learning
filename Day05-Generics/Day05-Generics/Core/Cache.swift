//
//  Cache.swift
//  Day05-Generics
//
//  Created by RD前端-dodo on 2026/5/25.
//

import Foundation

final class Cache<Key: Hashable, Value> {
    private var storage: [Key : Value] = [:]
    private let lock = NSLock()
    
    var count: Int {
        lock.lock()
        defer {
            lock.unlock()
        }
        return storage.count
    }
    
    func value(forKey key: Key) -> Value? {
        lock.lock()
        defer {lock.unlock()}
        return storage[key]
    }
    
    func insert(_ value: Value, forKey key: Key) {
        lock.lock()
        defer {lock.unlock()}
        storage[key] = value
    }
    
    func removeKey(forKey key: Key) {
        lock.lock()
        defer {lock.unlock()}
        storage[key] = nil
    }
    
    func removeAll() {
        lock.lock()
        defer {lock.unlock()}
        storage.removeAll()
    }
    
    subscript(key: Key) -> Value? {
        get {
            value(forKey: key)
        } set {
            if let newValue = newValue {
                insert(newValue, forKey: key)
            } else {
                removeKey(forKey: key)
            }
        }
    }
    
}

extension Cache {
    func insert(_ value: Value, forKey key: Key, maxCount: Int) where Key: Hashable {
        insert(value, forKey: key)
        guard storage.count > maxCount else {return}
        if let firstKey = storage.keys.first {
            storage[firstKey] = nil
        }
    }
}
