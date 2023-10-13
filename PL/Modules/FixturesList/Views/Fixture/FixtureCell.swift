//
//  FixtureCell.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//

import UIKit

class FixtureCell: UITableViewCell {

    @IBOutlet private weak var favourite: UIButton!
    @IBOutlet private weak var homeTeam: TeamView!
    @IBOutlet private weak var status: UILabel!
    @IBOutlet private weak var background: UIView!
    @IBOutlet private weak var awayTeam: TeamView!
    override func awakeFromNib() {
        super.awakeFromNib()
        background.makeBorder()
    }

    func setFixture(_ fixture: FixtureDomainModel) {
        awayTeam.setTeam(fixture.awayTeam,
                         teamResult: getAwayTeamResult(fixture.score))
        homeTeam.setTeam(fixture.homeTeam,
                         teamResult: getHomeTeamResult(fixture.score))
        status.text = getStatus(fixture.status ?? .SCHEDULED)

    }

    private func getAwayTeamResult(_ score: ScoreDomainModel?) -> String {

        if getTeamResult(score)?.awayTeam  == nil {
            return ""
        } else {
            return String(getTeamResult(score)?.awayTeam ?? 0)
        }
    }
    private func getHomeTeamResult(_ score: ScoreDomainModel?) -> String {
        if getTeamResult(score)?.homeTeam  == nil {
            return ""
        } else {
            return String(getTeamResult(score)?.homeTeam ?? 0)
        }
    }

    private func getTeamResult(_ score: ScoreDomainModel?) -> ResultDomainModel? {
        if score?.fullTime != nil {return score?.fullTime}
        else if score?.halfTime != nil {return score?.halfTime}
        else {return nil}
    }

    private func getStatus(_ status: TimeStatus) -> String {

        switch status {

        case .FINISHED:
            return "FT"
        case .PAUSED:
            return "HT"
        case .IN_PLAY:
            return "live"
        default:
            return "12:34"
        }
    }

    private func setFavourite() {
        favourite.setImage(UIImage(named: "star.fill"), for: .normal)
    }
    private func setUnfavourite() {
        favourite.setImage(UIImage(named: "star"), for: .normal)
    }
}
