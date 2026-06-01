//
//  AppError.swift
//  Day14-HabitAPIClient
//

import Foundation

enum AppError: Error, Sendable {
    case networkUnavailable
    case requestFailed(statusCode: Int)
    case invalidResponse
    case decodingFailed(underlying: DecodingError)
    case emptyData
    case habitNotFound(id: String)
    case notImplemented
    case unknown(String)
}

extension AppError {
    var userMessage: String {
        switch self {
        case .networkUnavailable:
            return "网络不可用，请检查连接"
        case .requestFailed(let code):
            return "服务器错误（\(code)）"
        case .invalidResponse:
            return "数据格式异常"
        case .decodingFailed:
            return "解析失败，请稍后重试"
        case .emptyData:
            return "暂无数据"
        case .habitNotFound:
            return "找不到该习惯"
        case .notImplemented:
            return "功能开发中"
        case .unknown:
            return "发生未知错误"
        }
    }

    var debugDescription: String {
        switch self {
        case .decodingFailed(let underlying):
            return "decoding: \(underlying)"
        case .unknown(let message):
            return "unknown: \(message)"
        default:
            return userMessage
        }
    }
}

extension AppError {
    static func map(_ error: Error) -> AppError {
        if let app = error as? AppError {
            return app
        }
        if let decoding = error as? DecodingError {
            return .decodingFailed(underlying: decoding)
        }
        if let url = error as? URLError {
            switch url.code {
            case .notConnectedToInternet, .networkConnectionLost:
                return .networkUnavailable
            default:
                return .unknown(url.localizedDescription)
            }
        }
        return .unknown(error.localizedDescription)
    }
}
