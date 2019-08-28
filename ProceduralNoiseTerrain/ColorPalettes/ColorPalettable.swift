//
//  ColorPalettable.swift
//  NoiseTerrainGeneratoe
//
//  Created by Andre Sarokhanian on 8/7/19.
//  Copyright © 2019 Andre Sarokhanian. All rights reserved.
//

import Foundation
import UIKit


protocol ColorPalettable {
    
    func getColor(from value: Float) -> Pixel
}
