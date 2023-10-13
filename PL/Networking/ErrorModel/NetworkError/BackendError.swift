//
//  BackendError.swift
//  PL
//
//  Created by ammar on 14/10/2023.
//

import Foundation

struct BackendError: Codable, Error {
    var status: String
    var message: String
}
