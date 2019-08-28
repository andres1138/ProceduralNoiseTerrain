//
//  Pixel.swift
//  NoiseTerrainGeneratoe
//
//  Created by Andre Sarokhanian on 8/7/19.
//  Copyright © 2019 Andre Sarokhanian. All rights reserved.
//

import Foundation
import UIKit


struct Pixel {
    let red: UInt8
    let green: UInt8
    let blue: UInt8
    let alpha: UInt8
    
    init(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    
    static let clearPixel = Pixel(red: 0, green: 0, blue: 0, alpha: 0)
}
