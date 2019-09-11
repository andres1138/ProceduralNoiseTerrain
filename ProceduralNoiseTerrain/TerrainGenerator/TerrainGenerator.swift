//
//  TerrainGenerator.swift
//  NoiseTerrainGeneratoe
//
//  Created by Andre Sarokhanian on 8/7/19.
//  Copyright © 2019 Andre Sarokhanian. All rights reserved.
//

import Foundation
import GameKit
import SpriteKit
import UIKit







class TerrainGenerator {
    
 private static let terrainPalettes: [ColorPalettable] = [EarthTerrainPalette(), RandomTerrainPalette(), RandomTerrainPalette1(),RandomHTMLTerrainPalette(), RandomHTMLTerrainPalette2()]
    //private static let terrainPalettes: [ColorPalettable] = [RandomHTMLTerrainPalette()]

    
    
    static func generateTerrain(squared side: Int = 256, colorPalette: ColorPalettable? = nil) -> SKTexture {
      var pixels = [Pixel]()
        
        let floatSide = Float(side)
        let size = CGSize(width: side, height: side)
        let radius = CGFloat(side) / 2
        let center = CGPoint(x: radius, y: radius)
        let randomNum = GKRandomSource.sharedRandom().nextInt(upperBound: terrainPalettes.count)
        let palette = colorPalette ?? terrainPalettes[randomNum]
        let noise =  NoiseMaker.perlinNoise()
        
        for x in 0..<side {
            let medX = Float(x) / floatSide - 0.5
            
            for y in 0..<side {
                
                guard isInsideCircle(point: CGPoint(x: x, y: y), center: center, radius: radius) else  {
                    pixels.append(.clearPixel)
                    continue
                }
                
                let medY = Float(y) / floatSide - 0.5
                
                let terrainColors = Float(noise.value(atPosition: vector_float2(medX, medY)))
                
                pixels.append(palette.getColor(from: terrainColors))
            }
        }
        
        let pixelsData = pixels.withUnsafeBufferPointer { Data(buffer: $0) }
        let tex = SKTexture(data: pixelsData, size: size)
       
        return tex
    }
    
    
    static func generateTerrainFlat(squared side: Int = 256, colorPalette: ColorPalettable? = nil) -> SKTexture {
        var pixels = [Pixel]()
        
        let floatSide = Float(side)
        let size = CGSize(width: side, height: side)
       
       
        let randomNum = GKRandomSource.sharedRandom().nextInt(upperBound: terrainPalettes.count)
        let palette = colorPalette ?? terrainPalettes[randomNum]
        let noise =  NoiseMaker.perlinNoise()
        
        for x in 0..<side {
           
            
            for y in 0..<side {
                
               let medX = Float(x) / floatSide - 0.5
                
                let medY = Float(y) / floatSide - 0.5
                
                let terrainColors = Float(noise.value(atPosition: vector_float2(medX, medY)))
                
                pixels.append(palette.getColor(from: terrainColors))
            }
        }
        
        let pixelsData = pixels.withUnsafeBufferPointer { Data(buffer: $0) }
        
        return SKTexture(data: pixelsData, size: size)
    }
    
    
    
    static func generateBillowNoise(squared side: Int = 256, colorPalette: ColorPalettable? = nil) -> SKTexture {
        var pixels = [Pixel]()
        
        let floatSide = Float(side)
        let size = CGSize(width: side, height: side)
        
        
        let randomNum = GKRandomSource.sharedRandom().nextInt(upperBound: terrainPalettes.count)
        let palette = colorPalette ?? terrainPalettes[randomNum]
        let noise =  NoiseMaker.billowNoise()
        
        for x in 0..<side {
            
            
            for y in 0..<side {
                
                let medX = Float(x) / floatSide - 0.5
                
                let medY = Float(y) / floatSide - 0.5
                
                let terrainColors = Float(noise.value(atPosition: vector_float2(medX, medY)))
                
                pixels.append(palette.getColor(from: terrainColors))
            }
        }
        
        let pixelsData = pixels.withUnsafeBufferPointer { Data(buffer: $0) }
        
        return SKTexture(data: pixelsData, size: size)
    }
    
    
    static func generateVoronoiNoise(squared side: Int = 256, colorPalette: ColorPalettable? = nil) -> SKTexture {
        var pixels = [Pixel]()
        
        let floatSide = Float(side)
        let size = CGSize(width: side, height: side)
        
        
        let randomNum = GKRandomSource.sharedRandom().nextInt(upperBound: terrainPalettes.count)
        let palette = colorPalette ?? terrainPalettes[randomNum]
        let noise =  NoiseMaker.voronoiNoise()
        
        for x in 0..<side {
            
            
            for y in 0..<side {
                
                let medX = Float(x) / floatSide - 0.5
                
                let medY = Float(y) / floatSide - 0.5
                
                let terrainColors = Float(noise.value(atPosition: vector_float2(medX, medY)))
                
                pixels.append(palette.getColor(from: terrainColors))
            }
        }
        
        let pixelsData = pixels.withUnsafeBufferPointer { Data(buffer: $0) }
        
        return SKTexture(data: pixelsData, size: size)
    }
    
    
    static func isInsideCircle(point: CGPoint, center: CGPoint, radius: CGFloat) -> Bool {
        return pow(point.x - center.x, 2) + pow(point.y - center.y, 2) < pow(radius, 2)
    }

   
}


