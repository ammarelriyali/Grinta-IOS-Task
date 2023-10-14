//
//  FixturesUseCasesImp.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//

import Foundation

struct FixturesUseCasesImp: FixturesUseCasesProtocol {

    private let repository: FixturesRepoProtocol

    init(repository: FixturesRepoProtocol) {
        self.repository = repository
    }

    func getFixtures(completion: @escaping (Result<[FixtureDomainModel], NetworkError>) -> Void) {
        repository.getFixtures { (result: Result<[FixtureDomainModel], NetworkError>)  in
            switch result {
            case .success(let response):

                completion(.success(filterFixtures(response)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    private func filterFixtures(_ fixtures: [FixtureDomainModel]) -> [FixtureDomainModel] {
        let currentDate = Date()

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let formattedCurrentDate = dateFormatter.string(from: currentDate)
        return fixtures.filter { $0.date >= formattedCurrentDate}
    }

    func getSavedIds(completion: @escaping ([Int]) -> Void) {
        repository.getSavedIds(completion: completion)
    }

    func appendId(id: Int) {
        repository.appendId(id: id)
    }

    func remveId(id: Int) {
        repository.remveId(id: id)
    }
}
