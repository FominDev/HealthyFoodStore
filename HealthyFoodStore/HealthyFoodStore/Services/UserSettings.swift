//
//  UserSettings.swift
//  HealthyFoodStore
//
//  Created by Артур Фомин on 18.02.2024.
//

import Foundation

class UserSettings {
    
    static let shared = UserSettings()
    
    var onboardingIsHidden: Bool {
        get {
            UserDefaults.standard.bool(forKey: "onboardingIsHidden")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "onboardingIsHidden")
        }
    }
    private init() {}
}
