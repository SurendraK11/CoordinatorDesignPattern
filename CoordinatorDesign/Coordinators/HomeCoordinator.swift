//
//  HomeCoordinator.swift
//  CoordinatorDesign
//
//  Created by Surendra on 04/06/2020.
//  Copyright © 2020 Surendra. All rights reserved.
//

import UIKit

protocol Buying: class {
    func buySubscription()
}

protocol AccountCreating: class {
    func createAccount()
}


class HomeCoordinator: NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let vc = HomeViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
}

extension HomeCoordinator: Buying, AccountCreating {
    
    func buySubscription() {
        let child = BuyCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.start()
    }
    
    func createAccount() {
        let child = CreateAccountCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
}

extension HomeCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        //check if navigationController contains fromViewController, if contains then
        //it means that it's pushing another view controller rather than pop view controller
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        //if control reached here it means navigationController did pop a view controller
        if let popedVC = fromViewController as? Coordinated {
            childDidFinish(popedVC.getCoordinator())
        }
    }
}
