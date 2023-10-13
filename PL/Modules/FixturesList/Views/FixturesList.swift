//
//  FixturesList.swift
//  PL
//
//  Created by ammar on 12/10/2023.
//

import UIKit

class FixturesList: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let fakeData: [FixtureDomainModel] = [
        FixtureDomainModel(id: 0, status: .FINISHED,
                           score: ScoreDomainModel(fullTime: ResultDomainModel(homeTeam: 11,
                                                                               awayTeam: 2),
                                                   halfTime: ResultDomainModel(homeTeam: 0, awayTeam: 0)),
                           homeTeam: TeamDomainModel(id: 1, name: "Liverpoll"),
                           awayTeam: TeamDomainModel(id: 19, name: "ManUinted"),
                           date: "2023-10-13",
                           time: "19:00"),
        FixtureDomainModel(id: 0, status: .IN_PLAY,
                           score: ScoreDomainModel(fullTime: nil,
                                                   halfTime: ResultDomainModel(homeTeam: 0, awayTeam: 0)),
                           homeTeam: TeamDomainModel(id: 1, name: "Liverpoll"),
                           awayTeam: TeamDomainModel(id: 19, name: "ManUinted"),
                           date: "2023-10-14",
                           time: "19:00"),
        FixtureDomainModel(id: 0, status: .SCHEDULED,
                           score: ScoreDomainModel(fullTime: nil,
                                                   halfTime: nil),
                           homeTeam: TeamDomainModel(id: 1, name: "Liverpoll"),
                           awayTeam: TeamDomainModel(id: 19, name: "ManUinted"),
                           date: "2023-10-13",
                           time: "19:00"),
        FixtureDomainModel(id: 0, status: .CANCELLED,
                           score: ScoreDomainModel(fullTime: nil,
                                                   halfTime: nil),
                           homeTeam: TeamDomainModel(id: 1, name: "Liverpoll"),
                           awayTeam: TeamDomainModel(id: 19, name: "ManUinted"),
                           date: "2023-10-13",
                           time: "19:00")

    ]
    // TODO: - sort by time
    var data: [String: [FixtureDomainModel]] = [:]
    var arrSection: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initTable()
        for fixture in fakeData {
            data[fixture.date, default: []].append(fixture)
        }
        arrSection =  Array(data.keys).sorted()

    }

    private func initTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(FixtureCell.self)
    }
}

extension FixturesList: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return arrSection.count
       }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[arrSection[section], default: []].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(FixtureCell.self, for: indexPath)
        cell.setFixture(data[arrSection[indexPath.section], default: []][indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrSection[section]
        }
}
