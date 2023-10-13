//
//  UIState.swift
//  PL
//
//  Created by ammar on 13/10/2023.
//

import Foundation

enum UIState<T>{
    case initial
    case loading
    case loaded(data: T)
    case error(error: any Error)
}
