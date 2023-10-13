//
//  ResultMatchDataModel.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//

import Foundation

struct ResultMatchDataModel: Codable {

    let homeTeam: Int?
    let awayTeam: Int?
    func mapToDomainModel() -> ResultFixtureDomainModel {
        ResultFixtureDomainModel(homeTeam: homeTeam, awayTeam: awayTeam)
    }
}
