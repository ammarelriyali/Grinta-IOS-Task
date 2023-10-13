//
//  FixturesList.swift
//  PL
//
//  Created by ammar on 12/10/2023.
//

import UIKit
import Combine

class FixturesList: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - View Model
    var viewModel: AnyFixturesViewModel = FixturesViewModel(fixturesUseCases:
                                                                FixturesUseCasesImp(repository:
                                                                                        FixturesRepoImp()))
    
    // MARK: - Private Properties
    private var subscribers: [AnyCancellable] = []
    private let refreshControl = UIRefreshControl()
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        viewModel.uiStatePublisher
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: handleUIState)
            .store(in: &subscribers)
        
        initTable()
        initRefreshControl()
    
        viewModel.loadFixtures()
    }
    
    @objc func refreshData(_ sender: UIRefreshControl) {
        viewModel.loadFixtures()
    }
    
    private func initRefreshControl() {
        
        refreshControl.attributedTitle = NSAttributedString(string: "Refresh Fixtures")
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
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
            refreshControl.endRefreshing()
            tableView.reloadData()
        case .error(error: let error):
            print(error)
        default:
            break
        }
    }
}
