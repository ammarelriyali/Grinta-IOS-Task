//
//  FixtureMainResponse.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//

import Foundation

struct FixtureMainResponse: Codable {
    
    let count: Int?
    let filters: [String]?
    let competition: CompetitionDataModel?
    var matches: [MatchesDataModel]?
    
   
}
