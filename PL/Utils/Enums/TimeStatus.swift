//
//  TimeStatus.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//
// swiftlint:disable identifier_name

import Foundation

enum TimeStatus: String, Codable {

    case SCHEDULED
    case TIMED
    case IN_PLAY
    case PAUSED
    case FINISHED
    case SUSPENDED
    case POSTPONED
    case CANCELLED
    case AWARDED
}
