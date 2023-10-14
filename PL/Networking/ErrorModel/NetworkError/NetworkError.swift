//
//  NetworkError.swift
//  PL
//
//  Created by ammar on 14/10/2023.
//

import Foundation
import Alamofire

struct NetworkError: Error, Equatable {

    let initialError: AFError
    let backendError: BackendError?
}

extension NetworkError {
    static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        lhs.backendError == rhs.backendError
    }
}
