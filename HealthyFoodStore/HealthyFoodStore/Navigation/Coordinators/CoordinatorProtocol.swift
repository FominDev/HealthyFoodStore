//
//  CoordinatorProtocol.swift
//  HealthyFoodStore
//
//  Created by Артур Фомин on 13.02.2024.
//

import UIKit

enum CoordinatorType {
    case app
    case onboarding
    case home
    case category
    case cart
    case profile
}

protocol CoordinatorProtocol: AnyObject {
    
    var type: CoordinatorType { get }
    var childCoordinators: [CoordinatorProtocol] { get set }
    var navigationController: UINavigationController? { get set }
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    
    func start()
    func finish()
}

extension CoordinatorProtocol {
    func addChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators.append(childCoordinator)
    }
    func removeChildCoordinator(_ childCoordinator: CoordinatorProtocol) {
        childCoordinators = childCoordinators.filter{$0 !== childCoordinator}
    }
}

protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol)
}
