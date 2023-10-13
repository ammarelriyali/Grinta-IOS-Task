//
//  FixturesList+UITableView.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//

import UIKit

extension FixturesList: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.getSectionsCount()
       }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getFixtureCount(section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(FixtureCell.self, for: indexPath)
        cell.setFixture(viewModel.getFixture(indexPath))
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.getSection(section)
        }
}
