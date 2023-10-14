//
//  FixtureCell.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//

import UIKit

class FixtureCell: UITableViewCell {

    @IBOutlet private weak var favourite: UIImageView!
    @IBOutlet private weak var homeTeam: TeamView!
    @IBOutlet private weak var status: UILabel!
    @IBOutlet private weak var background: UIView!
    @IBOutlet private weak var awayTeam: TeamView!

    var onFavClicked: (() -> Bool)?

    override func awakeFromNib() {
        super.awakeFromNib()
        background.makeBorder()

        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(imageTapped(tapGestureRecognizer:)))
        favourite.isUserInteractionEnabled = true
        favourite.addGestureRecognizer(tapGestureRecognizer)

    }

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        guard let onFavClicked = onFavClicked else {return}
        if onFavClicked() {
            setFavourite()
        } else {
            setUnfavourite()
        }
    }

    func setFixture(_ fixture: FixtureDomainModel, onFavClicked: @escaping () -> Bool ) {
        awayTeam.setTeam(fixture.awayTeam,
                         teamResult: getAwayTeamResult(fixture.score))
        homeTeam.setTeam(fixture.homeTeam,
                         teamResult: getHomeTeamResult(fixture.score))
        status.text = getStatus(fixture.status ?? .SCHEDULED, time: fixture.time)
        self.onFavClicked = onFavClicked

        if fixture.isFavorite ?? false {
            setFavourite()
        } else {
            setUnfavourite()
        }
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

    private func getTeamResult(_ score: ScoreDomainModel?) -> ResultFixtureDomainModel? {
        if score?.fullTime != nil {
            return score?.fullTime
        } else if score?.halfTime != nil {
            return score?.halfTime
        } else {return nil}
    }

    private func getStatus(_ status: TimeStatus, time: String) -> String {

        switch status {

        case .FINISHED:
            return "FT"
        case .PAUSED:
            return "HT"
        case .IN_PLAY:
            return "live"
        default:
            return time
        }
    }

    private func setFavourite() {
        if let newImage = UIImage(systemName: "heart.fill") {
            favourite.image = newImage
        }
    }
    private func setUnfavourite() {
        if let newImage = UIImage(systemName: "heart") {
            favourite.image = newImage
        }

    }
}
