//
//  FixturesRepoImp.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//

import Foundation

struct FixturesRepoImp: FixturesRepoProtocol {
    
    func getFixtures(completion: @escaping (Result<[FixtureDomainModel], NetworkError>) -> Void) {
        NetworkClient.shared.request(targetUrl: FixturesDataSource.url,
                                     parameters: nil,
                                     method: .get,
                                     completion: { (result: Result<FixtureMainResponse, NetworkError>) in
            switch result {
            case .success(let response):
                completion(.success(response
                    .matches?
                    .compactMap { $0.mapToDomainModel() } ?? []
                ))
            case .failure(let error):
                completion(.failure(error))
                
            }
        }
        )
    }
    
    func getSavedIds(completion: @escaping ([Int]) -> Void) {
        if let data: [Int] = UserDefaultsManager.shared.read(forKey: FixturesDataSource.userDefaultsKey) {
            completion(data)
        }
        else {
            completion([])
        }
    }
    
    func appendId(id: Int) {
        if var data: [Int] = UserDefaultsManager.shared.read(forKey: FixturesDataSource.userDefaultsKey) {
            data.append(id)
            UserDefaultsManager.shared.write(data, forKey: FixturesDataSource.userDefaultsKey)
        }
    }
    func remveId(id: Int) {
        if var data: [Int] = UserDefaultsManager.shared.read(forKey: FixturesDataSource.userDefaultsKey) {
            data.removeFirst(id)
            UserDefaultsManager.shared.write(data, forKey: FixturesDataSource.userDefaultsKey)
        }
    }
}
