//
//  BuyViewController.swift
//  CoordinatorDesign
//
//  Created by Surendra on 04/06/2020.
//  Copyright © 2020 Surendra. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController, Storyboarded {
    weak var coordinator: BuyCoordinatorProtocol?
    
    deinit {
        print("deinit - BuyViewController")
    }
}

extension BuyViewController: Coordinated {
    func getCoordinator() -> Coordinator? {
        return coordinator
    }
}
