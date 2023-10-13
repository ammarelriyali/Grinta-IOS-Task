//
//  MatchesDataModel.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//

import Foundation
struct MatchesDataModel: Codable {

    let id: Int?
    let season: SeasonDataModel?
    let utcDate: String?
    let status: TimeStatus?
    let matchday: Int?
    let stage: String?
    let group: String?
    let lastUpdated: String?
    let odds: OddsDataModel?
    let score: ScoreDataModel?
    let homeTeam: TeamDataModel?
    let awayTeam: TeamDataModel?
    let referees: [RefereeDataModel]?

    func mapToDomainModel() -> FixtureDomainModel {

        return FixtureDomainModel(id: id,
                                  status: status,
                                  score: score?.mapToDomainModel(),
                                  homeTeam: homeTeam?.mapToDomainModel(),
                                  awayTeam: awayTeam?.mapToDomainModel(),
                                  date: getData(utcDate),
                                  time: getTime(utcDate),
                                  isFavorite: false)
    }

    private func getTime(_ utcDate: String?) -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: utcDate ?? "2024-01-13T00:00:00Z" )
        else {return ""}

        let dateFormatterTime = DateFormatter()
        dateFormatterTime.dateFormat = "HH:mm"
        let formattedTime = dateFormatterTime.string(from: date)
        return formattedTime
    }

    private func getData(_ utcDate: String?) -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: utcDate ?? "2024-01-13T00:00:00Z" )
        else {return ""}

        let dateFormatterDate = DateFormatter()
        dateFormatterDate.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatterDate.string(from: date)
        return formattedDate
    }
}
