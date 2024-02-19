//
//  AppCoordinator.swift
//  HealthyFoodStore
//
//  Created by Артур Фомин on 13.02.2024.
//

import UIKit

class AppCoordinator: Coordinator {
    
    //MARK: - Properties
    private let userSettings = UserSettings.shared
    private let factory = SceneFactory.self
    
    override func start() {
        if userSettings.onboardingIsHidden {
            showTabBarFlow()
        } else {
            showOnboardingFlow()
        }
    }
    
    override func finish() {
        print("Finish AppCoordinator")
    }
}

extension AppCoordinator:  CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .onboarding:
            navigationController?.viewControllers.removeAll()
            showTabBarFlow()
        case .app:
            return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
    
    
}

// MARK: - Navigation methods

private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        factory.makeOnboardingFlow(navigationController: navigationController, finishDelegate: self, coordinator: self)
    }
    func showTabBarFlow() {
        guard let navigationController = navigationController else { return }
        
        let tabBarController = factory.makeTabBarFlow(finishDelegate: self, coordinator: self)
        
        navigationController.pushViewController(tabBarController, animated: true)
    }
}
