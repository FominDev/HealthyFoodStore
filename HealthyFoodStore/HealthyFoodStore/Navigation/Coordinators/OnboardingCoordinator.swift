//
//  OnboardingCoordinator.swift
//  HealthyFoodStore
//
//  Created by Артур Фомин on 13.02.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    //MARK: - Properties
    private let factory = SceneFactory.self
    
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        finishDelegate?.coordinatorDidFinish(childCoordinator: self)
    }
}

private extension OnboardingCoordinator {
    func showOnboarding() {
        let onboardingViewController = factory.makeOnboarding(coordinator: self)
        navigationController?.pushViewController(onboardingViewController, animated: true)
    }
}
