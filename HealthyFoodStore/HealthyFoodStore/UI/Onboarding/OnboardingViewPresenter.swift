//
//  OnboardingViewPresenter.swift
//  HealthyFoodStore
//
//  Created by Артур Фомин on 17.02.2024.
//

import UIKit

protocol OnboardingViewPresenterProtocol {
    func finishOnboarding()
}

class OnboardingViewPresenter: OnboardingViewPresenterProtocol {
    //MARK: - Properties
    weak var coordinator: OnboardingCoordinator!
    private let userSettings = UserSettings.shared
    
    //MARK: - Initializers
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    func finishOnboarding() {
        userSettings.onboardingIsHidden = true
        coordinator.finish()
    }
    
    
}
