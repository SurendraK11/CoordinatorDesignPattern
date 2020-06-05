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
    
    weak var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        let navigationVC = UINavigationController(rootViewController: vc)
        navigationController.present(navigationVC, animated: true, completion: nil)
        
    }
    
    func doneButtonTapped() {
        navigationController.dismiss(animated: true) {
            [weak self] in
            self?.parentCoordinator?.childDidFinish(self)
        }
    }
}
