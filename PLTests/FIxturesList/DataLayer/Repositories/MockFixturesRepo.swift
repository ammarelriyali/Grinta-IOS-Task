//
//  MockFixturesRepo.swift
//  PLTests
//
//  Created by ammar on 14/10/2023.
//

import Foundation
@testable import PL

class MockFixturesRepo: FixturesRepoProtocol {
    
    var result: Result<[FixtureDomainModel], NetworkError>? = nil
    var ids: [Int] = []
    
    func getFixtures(completion: @escaping (Result<[FixtureDomainModel], NetworkError>) -> Void) {
        guard let result = result else {return}
        completion(result)
    }
    
    func getSavedIds(completion: @escaping ([Int]) -> Void) {
        completion(ids)
    }
    
    func appendId(id: Int) {
        ids.append(id)
    }
    
    func remveId(id: Int) {
        if let index = ids.firstIndex(of: id) {
            ids.remove(at: index)
        }
    }
}
