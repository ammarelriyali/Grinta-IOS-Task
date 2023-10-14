//
//  AnyNetwork.swift
//  PL
//
//  Created by ammar on 14/10/2023.
//

import Foundation
import Alamofire

protocol AnyNetwork {
    func request<T: Decodable>(
        targetUrl: String,
        parameters: Parameters?,
        method: HTTPMethod,
        completion: @escaping (Result<T, NetworkError>) -> Void
    )
}
