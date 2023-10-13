//
//  UITableView+CellRegistration.swift
//  PL
//
//  Created by ammar on 12/10/2023.
//

import UIKit

extension UITableView {

    func registerCell<T: UITableViewCell>(_ cellClass: T.Type) {
        let cellIdentifier = String(describing: cellClass)
        register(UINib(nibName: cellIdentifier, bundle: .main), forCellReuseIdentifier: cellIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell> (_ cellClass: T.Type, for indexPath: IndexPath) -> T {
        let cellIdentifier = String(describing: cellClass)
        guard let cell = dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? T else {
            return T()
        }
        return cell
    }
}
