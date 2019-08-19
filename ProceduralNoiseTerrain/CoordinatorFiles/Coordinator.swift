//
//  Coordinator.swift
//  ProceduralNoiseTerrain
//
//  Created by Andre Sarokhanian on 8/19/19.
//  Copyright © 2019 Andre Sarokhanian. All rights reserved.
//

import Foundation
import UIKit


protocol Coordinator: AnyObject {
    
    var navigationController: UINavigationController { get set }
    
    func startInitialViewController()
}
