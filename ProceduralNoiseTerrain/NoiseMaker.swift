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
    
    static func perlinNoiseAnimated(_ sprite: SKSpriteNode) {
        
        let noiseSource = GKPerlinNoiseSource()
        noiseSource.frequency = Double(arc4random_uniform(7) + 3)
        noiseSource.octaveCount = Int(arc4random_uniform(7) + 4)
        noiseSource.persistence = 0.5
        noiseSource.lacunarity = 2.0
        
        noiseSource.seed = Int32(arc4random_uniform(10000))
        let noise = GKNoise(noiseSource)
        var map = GKNoiseMap(noise)
        
        let moveMap = SKAction.run {
            map = GKNoiseMap(noise, size: vector2(2, 2),
                                    origin: (vector2(map.origin.x+0.01, 0)),
                                    sampleCount: vector2(300, 300),
                                    seamless: false)
            
            sprite.texture = SKTexture(noiseMap: map)
        }
        
        
        let moveMapForever = SKAction.repeatForever(
            (SKAction.sequence([moveMap,
                                SKAction.wait(forDuration: 0.1)])))
        sprite.run(moveMapForever)
    }
   
    
    static func billowNoise() -> GKNoise {
        let noiseSource = GKBillowNoiseSource()
        
        let noise = GKNoise(noiseSource)
        return noise 
    }
    
}





