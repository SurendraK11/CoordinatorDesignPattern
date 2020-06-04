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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Buy Item"
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        coordinator?.doneButtonTapped()
    }
    
    
}

extension BuyViewController: Coordinated {
    func getCoordinator() -> Coordinator? {
        return coordinator
    }
}
