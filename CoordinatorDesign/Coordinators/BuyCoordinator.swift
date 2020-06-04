//
//  BuyCoordinator.swift
//  CoordinatorDesign
//
//  Created by Surendra on 04/06/2020.
//  Copyright © 2020 Surendra. All rights reserved.
//

import UIKit

protocol BuyCoordinatorProtocol: Coordinator {
    
}

class BuyCoordinator: BuyCoordinatorProtocol {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
           self.navigationController = navigationController
    }
    
    func start() {
        let vc = BuyViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
