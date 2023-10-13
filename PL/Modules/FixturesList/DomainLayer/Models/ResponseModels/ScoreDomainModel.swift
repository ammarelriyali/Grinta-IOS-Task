//
//  Score.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//

import Foundation

struct ScoreDomainModel {

    var winner: FixtureStatus?
    let fullTime: ResultFixtureDomainModel?
    let halfTime: ResultFixtureDomainModel?
}
