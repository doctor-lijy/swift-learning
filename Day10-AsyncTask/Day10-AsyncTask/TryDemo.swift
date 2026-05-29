//
//  TryDemo.swift
//  Day10-AsyncTask
//
//  Created by RD前端-dodo on 2026/5/28.
//

import Foundation


enum FileError: Error {
    case notFound
    case PermissionDenied
}
func readFile(name: String) throws -> String {
    if name.isEmpty {
        throw FileError.notFound
    }
    return "File content:\(name)"
}


