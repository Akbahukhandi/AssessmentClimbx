//
//  Enum.swift
//  AssignmentClimbax
//
//  Created by Aakanksha on 24/10/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case timeout
    case other(Error)
}

enum APIError: Error {
    case timeout
    case other(Error)
}
