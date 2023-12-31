//
//  NetworkClient.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//

import Foundation
import Alamofire

struct NetworkClient: AnyNetwork {

    static let shared = NetworkClient()

    private let apiKay = "c7106889dbab41bbbe8484e520e59aca"

    func request<T: Decodable>(
        targetUrl: String,
        parameters: Parameters?,
        method: HTTPMethod,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        let headers: HTTPHeaders = ["X-Auth-Token": apiKay]
        AF.request(
            targetUrl,
            method: method,
            parameters: parameters,
            headers: headers
        ).validate()
            .responseDecodable(decoder: JSONDecoder()) { (response: DataResponse<T, AFError>) in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    let backendError = response.data.flatMap {
                        try? JSONDecoder().decode(BackendError.self, from: $0)
                    }
                    let networkError = NetworkError(initialError: error, backendError: backendError)
                    completion(.failure(networkError))
                }
            }
    }
}
