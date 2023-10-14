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
                handleData(response)
                getFav()
                self.uiState = .loaded
            case .failure(let error):
                self.uiState = .error(error: error)
            }
        }
    }

    private func handleData(_ response: [FixtureDomainModel]) {
        data = [:]
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
        return data[section[index.section], default: []][index.row]
    }

    func getFixtureCount(_ index: Int) -> Int {
        data[section[index]]?.count ?? 0
    }

    func getFav() {
        fixturesUseCases.getSavedIds { [weak self] ids in
            guard let self = self else { return }
            for (key, items) in self.data {
                for index in items.indices {
                    if ids.contains(where: { id in items[index].id == id }) {
                        data[key, default: []][index].isFavorite = true
                    }
                }
            }
        }
    }

    func setFav(_ index: IndexPath) {
        let fixture = data[section[index.section], default: []][index.row]
        if fixture.isFavorite ?? false {
            fixturesUseCases.remveId(id: fixture.id ?? 0)
        } else {
            fixturesUseCases.appendId(id: fixture.id ?? 0)
        }
        data[section[index.section], default: []][index.row].isFavorite?.toggle()
    }

    func filterFav() {
        data = data.mapValues { array in
            return array.filter { $0.isFavorite ?? false }
        }
         data = data.filter { _, value in
            return !value.isEmpty
        }
    }
}
