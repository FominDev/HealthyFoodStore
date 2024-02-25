//
//  CategoryCoordinator.swift
//  HealthyFoodStore
//
//  Created by Артур Фомин on 17.02.2024.
//

import UIKit

class CategoryCoordinator: Coordinator {
    
    override func start() {
        let vc = CategoryViewController()
        vc.view.backgroundColor = AppColors.background
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func finish() {
        print("Finish Coordinator")
    }
}
