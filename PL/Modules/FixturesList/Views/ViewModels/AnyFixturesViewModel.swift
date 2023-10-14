//
//  AnyFixturesViewModel.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//

import Foundation

protocol AnyFixturesViewModel {

    var uiStatePublisher: Published<UIState>.Publisher { get }
    func loadFixtures()
    func getSectionsCount() -> Int
    func getSection(_ index: Int) -> String
    func getFixture(_ index: IndexPath) -> FixtureDomainModel
    func getFixtureCount(_ index: Int) -> Int
    func setFav(_ index: IndexPath)
    func filterFav()
}
