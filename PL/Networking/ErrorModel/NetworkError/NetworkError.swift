//
//  NetworkError.swift
//  PL
//
//  Created by ammar on 14/10/2023.
//

import Foundation
import Alamofire

struct NetworkError: Error {
    let initialError: AFError
    let backendError: BackendError?
}
