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

class FixturesViewModel: AnyFixturesViewModel {
    @Published private(set) var uiState: UIState<[League]> = .initial
    var uiStatePublisher: Published<UIState<[League]>>.Publisher { $uiState }
}
