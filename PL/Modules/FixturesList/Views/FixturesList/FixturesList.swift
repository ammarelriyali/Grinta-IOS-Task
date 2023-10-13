//
//  FixturesList.swift
//  PL
//
//  Created by ammar on 12/10/2023.
//

import UIKit
import Combine

class FixturesList: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var viewModel: AnyFixturesViewModel = FixturesViewModel(fixturesUseCases:
                                                                        FixturesUseCasesImp(repository:
                                                                                        FixturesRepoImp()))
    private var subscribers: [AnyCancellable] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.uiStatePublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: handleUIState)
            .store(in: &subscribers)
        initTable()
        viewModel.loadFixtures()

    }

    private func initTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCell(FixtureCell.self)

    }

    func handleUIState(_ state: UIState) {
        switch state {
        case .loading:
            break
        case .loaded:
            tableView.reloadData()
        case .error(error: let error):
            print(error)
        default:
            break
        }
    }
}
