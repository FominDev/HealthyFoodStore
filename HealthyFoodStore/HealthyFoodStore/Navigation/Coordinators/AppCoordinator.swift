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
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    func showTabBarFlow() {
        guard let navigationController = navigationController else { return }
        
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        homeCoordinator.finishDelegate = self
        homeCoordinator.start()
        
        let categoryNavigationController = UINavigationController()
        let categoryCoordinator = CategoryCoordinator(type: .category, navigationController: categoryNavigationController)
        categoryNavigationController.tabBarItem = UITabBarItem(title: "Category", image: UIImage(systemName: "list.bullet"), tag: 1)
        categoryCoordinator.finishDelegate = self
        categoryCoordinator.start()
        
        let cartNavigationController = UINavigationController()
        let cartCoordinator = CartCoordinator(type: .cart, navigationController: cartNavigationController)
        cartNavigationController.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart"), tag: 2)
        cartCoordinator.finishDelegate = self
        cartCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = CartCoordinator(type: .profile, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 3)
        profileCoordinator.finishDelegate = self
        profileCoordinator.start()
        
        addChildCoordinator(homeCoordinator)
        addChildCoordinator(categoryCoordinator)
        addChildCoordinator(cartCoordinator)
        addChildCoordinator(profileCoordinator)
        
        let navigationControllers = [homeNavigationController, categoryNavigationController, cartNavigationController, profileNavigationController]
        let tabBarController = TabBarController(tabBarControllers: navigationControllers)
        
        navigationController.pushViewController(tabBarController, animated: true)
    }
}
