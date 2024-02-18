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
        var pages = [UIViewController]()
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .systemPink
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .blue
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .red
        pages.append(firstVC)
        pages.append(secondVC)
        pages.append(thirdVC)
        
        let presenter = OnboardingViewPresenter(coordinator: self)
        let onboardingViewController = OnboardingViewController(pages: pages, viewPresenter: presenter)
        navigationController?.pushViewController(onboardingViewController, animated: true)
    }
}
