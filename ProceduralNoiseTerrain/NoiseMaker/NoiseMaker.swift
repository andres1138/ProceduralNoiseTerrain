//
//  NoiseMaker.swift
//  NoiseTerrainGeneratoe
//
//  Created by Andre Sarokhanian on 8/7/19.
//  Copyright © 2019 Andre Sarokhanian. All rights reserved.
//

import Foundation
import GameKit
import UIKit
import SpriteKit




class NoiseMaker {
    
    let noise: GKNoise
    
    init(noise: GKNoise) {
        self.noise = noise
    }
    
    static func perlinNoise() -> GKNoise {
        let noiseSource = GKPerlinNoiseSource()
        noiseSource.frequency = Double(arc4random_uniform(7) + 3)
        noiseSource.octaveCount = Int(arc4random_uniform(7) + 4)
        noiseSource.persistence = 0.5
        noiseSource.lacunarity = 2.0
      
        noiseSource.seed = Int32(arc4random_uniform(10000))
        let noise = GKNoise(noiseSource)
        
        return noise
    }
    
   
    
    static func billowNoise() -> GKNoise {
        let noiseSource = GKBillowNoiseSource()
        noiseSource.frequency = Double(arc4random_uniform(7) + 3)
        noiseSource.octaveCount = Int(arc4random_uniform(7) + 4)
        noiseSource.persistence = 0.5
        noiseSource.lacunarity = 2.0
        
        noiseSource.seed = Int32(arc4random_uniform(10000))

        let noise = GKNoise(noiseSource)
        return noise 
    }
    
    
    static func voronoiNoise() -> GKNoise {
        let noiseSource = GKVoronoiNoiseSource()
        noiseSource.frequency = Double(arc4random_uniform(8) + 2)
       noiseSource.displacement = 0.5
        noiseSource.isDistanceEnabled = true
        noiseSource.seed = Int32(arc4random_uniform(1000))

        let noise = GKNoise(noiseSource)
        return noise
    }
    
}





