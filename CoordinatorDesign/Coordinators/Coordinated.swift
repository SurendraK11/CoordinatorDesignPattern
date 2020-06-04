//
//  Coordinated.swift
//  CoordinatorDesign
//
//  Created by Surendra on 04/06/2020.
//  Copyright © 2020 Surendra. All rights reserved.
//

import UIKit

protocol Coordinated where Self: UIViewController {
    func getCoordinator() -> Coordinator?
}
