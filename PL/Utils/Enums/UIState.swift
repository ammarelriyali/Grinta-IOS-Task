//
//  UIState.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//

import Foundation

enum UIState {
    case initial
    case loading
    case loaded
    case error(error: NetworkError)
}
