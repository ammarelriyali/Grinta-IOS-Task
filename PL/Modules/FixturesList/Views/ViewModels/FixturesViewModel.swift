//
//  FixturesViewModel.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//

import Foundation
protocol AnyFixturesViewModel {
    var uiStatePublisher: Published<UIState<[FixtureCell]>>.Publisher { get }
    
    func loadFixtures()
}
@MainActor
class FixturesViewModel: AnyFixturesViewModel {
    @Published private(set) var uiState: UIState<[FixtureCell]> = .initial
    var uiStatePublisher: Published<UIState<[FixtureCell]>>.Publisher { $uiState }
    
    func loadFixtures() {
        
    }
}
