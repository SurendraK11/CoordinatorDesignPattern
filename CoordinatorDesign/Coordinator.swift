//
//  Coordinator.swift
//  CoordinatorDesign
//
//  Created by Surendra on 04/06/2020.
//  Copyright © 2020 Surendra. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func childDidFinish(_ child: Coordinator?)
    func start()
}

extension Coordinator {
    
    func childDidFinish(_ childCoordinator: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === childCoordinator {
                childCoordinators.remove(at: index)
                return
            }
        }
    }
}


