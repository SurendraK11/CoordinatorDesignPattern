//
//  CreateAccountViewController.swift
//  CoordinatorDesign
//
//  Created by Surendra on 04/06/2020.
//  Copyright © 2020 Surendra. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController, Storyboarded {
    weak var coordinator: CreateAccountCoordinatorProtocol?
    
    deinit {
        print("deinit - CreateAccountViewController")
    }
}


extension CreateAccountViewController: Coordinated {
    func getCoordinator() -> Coordinator? {
        return coordinator
    }
}
