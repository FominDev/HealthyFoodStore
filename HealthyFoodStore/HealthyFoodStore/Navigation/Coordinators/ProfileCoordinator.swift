//
//  ProfileCoordinator.swift
//  HealthyFoodStore
//
//  Created by Артур Фомин on 17.02.2024.
//

import UIKit

class ProfileCoordinator: Coordinator {
    
    override func start() {
        let vc = ViewController()
        vc.view.backgroundColor = .cyan
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("Finish AppCoordinator")
    }
}
