//
//  FixtureDomainModel.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//

import Foundation
struct FixtureDomainModel {
    let id: Int?
    let status: TimeStatus?
    let score: ScoreDomainModel?
    let homeTeam: TeamDomainModel?
    let awayTeam: TeamDomainModel?
    let date: String
    let time: String
    var isFavorite: Bool?
}
