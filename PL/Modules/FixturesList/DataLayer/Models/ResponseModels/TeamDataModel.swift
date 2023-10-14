//
//  TeamDataModel.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//

import Foundation

struct TeamDataModel: Codable {

    let id: Int?
    let name: String?

    func mapToDomainModel() -> TeamDomainModel {
        TeamDomainModel(id: id, name: name)
    }
}
