//
//  Coordinator.swift
//  CoordinatorDesign
//
//  Created by Surendra on 04/06/2020.
//  Copyright © 2020 Surendra. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    
    /// maintains child childCoordinators
    var childCoordinators: [Coordinator] { get set }
    
    var navigationController: UINavigationController { get set }

    func childDidFinish(_ child: Coordinator?)
    func start()
}

extension Coordinator {
    
    /// this is reponsible to remove  child coordinator, once view controller is popped out
    /// - Parameter childCoordinator: child coordinator
    func childDidFinish(_ childCoordinator: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === childCoordinator {
                childCoordinators.remove(at: index)
                return
            }
        }
    }
}


