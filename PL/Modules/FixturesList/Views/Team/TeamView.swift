//
//  TeamView.swift
//  PL
//
//  Created by ammar on 12/10/2023.
//

import UIKit

class TeamView: UIView, CustomViewProtocol {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var result: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func setTeam(_ team: TeamDomainModel?, teamResult: String) {
        guard let team = team else {return}
        title.text = team.name
        result.text = teamResult

    }
}
