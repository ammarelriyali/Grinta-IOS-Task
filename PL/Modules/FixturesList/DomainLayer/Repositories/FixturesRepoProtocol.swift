//
//  FixturesRepoProtocol.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//

import Foundation

protocol FixturesRepoProtocol {
    func getFixtures(completion: @escaping (Result<[FixtureDomainModel], NetworkError>) -> Void)

}