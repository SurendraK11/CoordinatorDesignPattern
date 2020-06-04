//
//  CoordinatorNavigationControllerDelegate.swift
//  CoordinatorDesign
//
//  Created by Surendra on 04/06/2020.
//  Copyright © 2020 Surendra. All rights reserved.
//

import UIKit

class CoordinatorNavigationControllerDelegate:NSObject, UINavigationControllerDelegate {
    let coordinator: Coordinator
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
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
            coordinator.childDidFinish(popedVC.getCoordinator())
        }
    }
}
