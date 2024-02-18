//
//  OnboardingCoordinator.swift
//  HealthyFoodStore
//
//  Created by Артур Фомин on 13.02.2024.
//

import UIKit

class OnboardingCoordinator: Coordinator {
    
    override func start() {
        showOnboarding()
    }
    
    override func finish() {
        print("Finish AppCoordinator")
    }
}

private extension OnboardingCoordinator {
    func showOnboarding() {
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
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let onboardingViewController = OnboardingViewController(pages: pages, viewPresenter: presenter)
        navigationController?.pushViewController(onboardingViewController, animated: true)
    }
}
