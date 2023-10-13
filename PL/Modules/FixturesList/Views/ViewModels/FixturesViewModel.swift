//
//  FixturesViewModel.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//

import Foundation

class FixturesViewModel: AnyFixturesViewModel {

    @Published private(set) var uiState: UIState = .initial
    var uiStatePublisher: Published<UIState>.Publisher { $uiState }

    let fixturesUseCases: FixturesUseCasesProtocol
    private var section: [String] = []
    private var  data: [String: [FixtureDomainModel]] = [:]

    init( fixturesUseCases: FixturesUseCasesProtocol) {
        self.fixturesUseCases = fixturesUseCases
    }

    func loadFixtures() {

        uiState = .loading
        fixturesUseCases.getFixtures { [weak self] (result: Result<[FixtureDomainModel], NetworkError>)  in
            guard let self = self else {return}
            switch result {
            case .success(let response):
                self.uiState = .loaded
                getSections(response)
            case .failure(let error):
                self.uiState = .error(error: error)
            }
        }
    }

    private func getSections(_ response: [FixtureDomainModel]) {
        for fixture in response {
            data[fixture.date, default: []].append(fixture)
            data[fixture.date, default: []].sort { fixtureOne, fixtureTwo in
                fixtureOne.time > fixtureTwo.time
            }
        }
        section =  Array(data.keys).sorted()
    }

    func getSectionsCount() -> Int {
        section.count
    }

    func getSection(_ index: Int) -> String {
        section[index]
    }

    func getFixture(_ index: IndexPath) -> FixtureDomainModel {
        data[section[index.section], default: []][index.row]
    }

    func getFixtureCount(_ index: Int) -> Int {
        data[section[index]]?.count ?? 0
    }
}
