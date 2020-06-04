//
//  HomeViewController.swift
//  CoordinatorDesign
//
//  Created by Surendra on 04/06/2020.
//  Copyright © 2020 Surendra. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, Storyboarded {

    weak var coordinator: (Buying & AccountCreating)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buy(_ sender: UIButton) {
        coordinator?.buySubscription()
    }
    
    @IBAction func createAccout(_ sender: UIButton) {
        coordinator?.createAccount()
    }
}



