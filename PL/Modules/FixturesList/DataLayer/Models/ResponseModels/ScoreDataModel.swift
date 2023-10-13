//
//  ScoreDataModel.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//

import Foundation

struct ScoreDataModel: Codable {

    let winner: FixtureStatus?
    let duration: String?
    let fullTime: ResultMatchDataModel?
    let halfTime: ResultMatchDataModel?
    let extraTime: ResultMatchDataModel?
    let penalties: ResultMatchDataModel?

    func mapToDomainModel() -> ScoreDomainModel {

        ScoreDomainModel(winner: winner, fullTime: fullTime?.mapToDomainModel(), halfTime: halfTime?.mapToDomainModel())
    }
}
