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

protocol TabBarCoordinator: AnyObject, CoordinatorProtocol {
    var tabBarController: UITabBarController? { get set }
}

class Coordinator: CoordinatorProtocol {
    
    var type: CoordinatorType
    
    var childCoordinators: [CoordinatorProtocol]
    
    var navigationController: UINavigationController?
    
    var finishDelegate: CoordinatorFinishDelegate?
    
    init(type: CoordinatorType, childCoordinators: [CoordinatorProtocol] = [CoordinatorProtocol](), navigationController: UINavigationController, finishDelegate: CoordinatorFinishDelegate? = nil) {
        self.type = type
        self.childCoordinators = childCoordinators
        self.navigationController = navigationController
        self.finishDelegate = finishDelegate
    }
    
    deinit {
        print("Coordinator deinited \(type)")
        childCoordinators.forEach { $0.finishDelegate = nil }
        childCoordinators.removeAll()
    }
    
    func start() {
        print("Coordinator start")
    }
    
    func finish() {
        print("Coordinator finish")
    }
    
    
}
