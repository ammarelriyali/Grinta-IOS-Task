//
//  FixturesRepoImp.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//

import Foundation
protocol FixturesRepoProtocol {
    func getFixtures(completion: @escaping (Result<MatchesDataModel, NetworkError>) -> Void)

}

struct FixturesRepoImp: FixturesRepoProtocol {
    
    func getFixtures(completion: @escaping (Result<MatchesDataModel, NetworkError>) -> Void) {
         NetworkClient.shared.request(targetUrl: FixturesDataSource.url,
                                                                      parameters: nil,
                                                                      method: .get,
                                                                      completion: completion
                                                                     )
    }
}
