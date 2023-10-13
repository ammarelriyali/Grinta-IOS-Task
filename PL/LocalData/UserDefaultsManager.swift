//
//  UserDefaultsManager.swift
//  PL
//
//  Created by ammar on 14/10/2023.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()

     func write<T>(_ value: T, forKey key: String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }

     func read<T>(forKey key: String) -> T? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: key) as? T
    }
}
