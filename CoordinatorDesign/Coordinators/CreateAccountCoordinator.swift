//
//  CreateAccountCoordinator.swift
//  CoordinatorDesign
//
//  Created by Surendra on 04/06/2020.
//  Copyright © 2020 Surendra. All rights reserved.
//

import UIKit

protocol CreateAccountCoordinatorProtocol: Coordinator {
    func doneButtonTapped()
}

class CreateAccountCoordinator: CreateAccountCoordinatorProtocol {
    
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func doneButtonTapped() {
        navigationController.popViewController(animated: true)
    }
}
