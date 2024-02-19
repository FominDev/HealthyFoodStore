//
//  SceneFactory.swift
//  HealthyFoodStore
//
//  Created by Артур Фомин on 19.02.2024.
//


import UIKit

struct SceneFactory {
    
    private init(){}
    
    //MARK: - Onboarding flow
    
    static func makeOnboardingFlow(navigationController: UINavigationController, finishDelegate: CoordinatorFinishDelegate, coordinator: AppCoordinator) {
        let onboardingCoordinator = OnboardingCoordinator(type: .onboarding, navigationController: navigationController, finishDelegate: finishDelegate)
        coordinator.addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    static func makeOnboarding(coordinator: OnboardingCoordinator) -> OnboardingViewController {
        var pages = [OnboardingPageViewController]()
        
        let firstVC = OnboardingPageViewController()
        firstVC.image = UIImage(systemName: "bolt")?.withTintColor(AppColors.white, renderingMode: .alwaysOriginal)
        firstVC.titleText = "Fast delivery"
        firstVC.descriptionText = "Our couriers will quickly deliver your products."
        firstVC.buttonText = "Next"
        
        let secondVC = OnboardingPageViewController()
        secondVC.image = UIImage(systemName: "person.fill.checkmark")?.withTintColor(AppColors.white, renderingMode: .alwaysOriginal)
        secondVC.titleText = "Highly qualified specialists"
        secondVC.descriptionText = "You are served by highly qualified specialists."
        secondVC.buttonText = "Next"
        
        let thirdVC = OnboardingPageViewController()
        thirdVC.image = UIImage(systemName: "figure.cooldown")?.withTintColor(AppColors.white, renderingMode: .alwaysOriginal)
        thirdVC.titleText = "Fitness Trainer Approved"
        thirdVC.descriptionText = "Our products are approved by fitness trainers."
        thirdVC.buttonText = "Next"
        
        let fourthVC = OnboardingPageViewController()
        fourthVC.image = UIImage(systemName: "figure.walk")?.withTintColor(AppColors.white, renderingMode: .alwaysOriginal)
        fourthVC.titleText = "In walking distance"
        fourthVC.descriptionText = "Most stores are within walking distance."
        fourthVC.buttonText = "Let's go!"
        
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        pages.append(fourthVC)
        
        let presenter = OnboardingViewPresenter(coordinator: coordinator)
        let onboardingViewController = OnboardingViewController(pages: pages, viewPresenter: presenter)
        
        return onboardingViewController
    }
    
    //MARK: - TabBar flow
    
    static func makeTabBarFlow(finishDelegate: CoordinatorFinishDelegate, coordinator: AppCoordinator) -> TabBarController {
        let homeNavigationController = UINavigationController()
        let homeCoordinator = HomeCoordinator(type: .home, navigationController: homeNavigationController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        homeCoordinator.finishDelegate = finishDelegate
        homeCoordinator.start()
        
        let categoryNavigationController = UINavigationController()
        let categoryCoordinator = CategoryCoordinator(type: .category, navigationController: categoryNavigationController)
        categoryNavigationController.tabBarItem = UITabBarItem(title: "Category", image: UIImage(systemName: "list.bullet"), tag: 1)
        categoryCoordinator.finishDelegate = finishDelegate
        categoryCoordinator.start()
        
        let cartNavigationController = UINavigationController()
        let cartCoordinator = CartCoordinator(type: .cart, navigationController: cartNavigationController)
        cartNavigationController.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(systemName: "cart"), tag: 2)
        cartCoordinator.finishDelegate = finishDelegate
        cartCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = CartCoordinator(type: .profile, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 3)
        profileCoordinator.finishDelegate = finishDelegate
        profileCoordinator.start()
        
        coordinator.addChildCoordinator(homeCoordinator)
        coordinator.addChildCoordinator(categoryCoordinator)
        coordinator.addChildCoordinator(cartCoordinator)
        coordinator.addChildCoordinator(profileCoordinator)
        
        let navigationControllers = [homeNavigationController, categoryNavigationController, cartNavigationController, profileNavigationController]
        let tabBarController = TabBarController(tabBarControllers: navigationControllers)
        
        return tabBarController
    }
}

