//
//  TerrainPalettes.swift
//  NoiseTerrainGeneratoe
//
//  Created by Andre Sarokhanian on 8/7/19.
//  Copyright © 2019 Andre Sarokhanian. All rights reserved.
//

import Foundation
import GameKit
import UIKit



struct EarthTerrainPalette: ColorPalettable {
    
    static let water2 = Pixel(red: 0, green: 100, blue: 200, alpha: 255)
    static let water = Pixel(red: 0, green: 0, blue: 255, alpha: 255)
    static let beach = Pixel(red: 0, green: 153, blue: 153, alpha: 255)
    static let jungle = Pixel(red: 0, green: 204, blue: 102, alpha: 255)
    static let forest = Pixel(red: 0, green: 204, blue: 0, alpha: 255)
    static let forest2 = Pixel(red: 0, green: 240, blue: 0, alpha: 255)
    static let savannah = Pixel(red: 204, green: 255, blue: 51, alpha: 255)
    static let desert = Pixel(red: 204, green: 204, blue: 0, alpha: 255)
    static let snow = Pixel(red: 255, green: 255, blue: 255, alpha: 255)
    
    func getColor(from value: Float) -> Pixel {
        
        switch value {
        case -1.0..<0.0:
            return EarthTerrainPalette.water
        case 0.0..<0.15:
            return EarthTerrainPalette.beach
        case 0.15..<0.3:
            return EarthTerrainPalette.jungle
        case 0.3..<0.6:
            return EarthTerrainPalette.forest
        case 0.6..<0.7:
            return EarthTerrainPalette.savannah
        case 0.7..<0.9:
            return EarthTerrainPalette.desert
        default:
            return EarthTerrainPalette.snow
        }
    }
}

struct RandomTerrainPalette: ColorPalettable {
    
    static let twater = randomColorPixel()
    static let tbeach = randomColorPixel()
    static let tjungle = randomColorPixel()
    static let tforest = randomColorPixel()
    static let tsavannah = randomColorPixel()
    static let tdesert = randomColorPixel()
    static let tsnow = randomColorPixel()
    
    
    func getColor(from value: Float) -> Pixel {
       
        switch value {
        case -1.0..<0.0:
            return RandomTerrainPalette.twater
        case 0.0..<0.15:
            return RandomTerrainPalette.tbeach
        case 0.15..<0.3:
            return RandomTerrainPalette.tjungle
        case 0.3..<0.6:
            return RandomTerrainPalette.tforest
        case 0.6..<0.7:
            return RandomTerrainPalette.tsavannah
        case 0.7..<0.9:
            return RandomTerrainPalette.tdesert
        default:
            return RandomTerrainPalette.tsnow
        }
    }
    
    
}

struct RandomTerrainPalette1: ColorPalettable {
    
    static let twater = randomColorPixel()
    static let tbeach = randomColorPixel()
    static let tjungle = randomColorPixel()
    static let tforest = randomColorPixel()
    static let tsavannah = randomColorPixel()
    static let tdesert = randomColorPixel()
    static let tsnow = randomColorPixel()
    
    
    func getColor(from value: Float) -> Pixel {
        
        switch value {
        case -1.0..<0.0:
            return RandomTerrainPalette1.twater
        case 0.0..<0.15:
            return RandomTerrainPalette1.tbeach
        case 0.15..<0.3:
            return RandomTerrainPalette1.tjungle
        case 0.3..<0.6:
            return RandomTerrainPalette1.tforest
        case 0.6..<0.7:
            return RandomTerrainPalette1.tsavannah
        case 0.7..<0.9:
            return RandomTerrainPalette1.tdesert
        default:
            return RandomTerrainPalette1.tsnow
        }
    }
    
    
}

struct RandomHTMLTerrainPalette: ColorPalettable {
    
    static let twater = convertHexToPixel(randomHTMLColor())
    static let tbeach = convertHexToPixel(randomHTMLColor())
    static let tjungle = convertHexToPixel(randomHTMLColor())
    static let tforest = convertHexToPixel(randomHTMLColor())
    static let tsavannah = convertHexToPixel(randomHTMLColor())
    static let tdesert = convertHexToPixel(randomHTMLColor())
    static let tsnow = convertHexToPixel(randomHTMLColor())
    
    
    func getColor(from value: Float) -> Pixel {
        
        switch value {
        case -1.0..<0.0:
            return RandomHTMLTerrainPalette.twater
        case 0.0..<0.15:
            return RandomHTMLTerrainPalette.tbeach
        case 0.15..<0.3:
            return RandomHTMLTerrainPalette.tjungle
        case 0.3..<0.6:
            return RandomHTMLTerrainPalette.tforest
        case 0.6..<0.7:
            return RandomHTMLTerrainPalette.tsavannah
        case 0.7..<0.9:
            return RandomHTMLTerrainPalette.tdesert
        default:
            return RandomTerrainPalette1.tsnow
        }
    }
    
    
}



struct RandomHTMLTerrainPalette2: ColorPalettable {
    
    static let twater = convertHexToPixel(randomHTMLColor())
    static let tbeach = convertHexToPixel(randomHTMLColor())
    static let tjungle = convertHexToPixel(randomHTMLColor())
    static let tforest = convertHexToPixel(randomHTMLColor())
    static let tsavannah = convertHexToPixel(randomHTMLColor())
    static let tdesert = convertHexToPixel(randomHTMLColor())
    static let tsnow = convertHexToPixel(randomHTMLColor())
    
    
    func getColor(from value: Float) -> Pixel {
        
        switch value {
        case -1.0..<0.0:
            return RandomHTMLTerrainPalette2.twater
        case 0.0..<0.15:
            return RandomHTMLTerrainPalette2.tbeach
        case 0.15..<0.3:
            return RandomHTMLTerrainPalette2.tjungle
        case 0.3..<0.6:
            return RandomHTMLTerrainPalette2.tforest
        case 0.6..<0.7:
            return RandomHTMLTerrainPalette2.tsavannah
        case 0.7..<0.9:
           return RandomHTMLTerrainPalette2.tdesert
        default:
            return RandomHTMLTerrainPalette2.tsnow
        }
    }
    
    
}




// returns a random pixel color
fileprivate func randomColorPixel() -> Pixel {
    
     let r = UInt8(GKRandomSource.sharedRandom().nextInt(upperBound: 255))
    let g = UInt8(GKRandomSource.sharedRandom().nextInt(upperBound: 255))
    let b = UInt8(GKRandomSource.sharedRandom().nextInt(upperBound: 255))
    let a = UInt8(255)
    
    return Pixel(red: r, green: g, blue: b, alpha: a)
}



// converts hex color string to custom Pixel Struct
fileprivate func convertHexToPixel(_ hexString: String) -> Pixel {
    var cString = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if (cString.count != 6) {
        return Pixel(red: 100, green: 100, blue: 100, alpha: 255)
    }
    
    var hexInt: UInt32 = UInt32(cString.hexToInt)
    
    Scanner(string: cString).scanHexInt32(&hexInt)
    
    let r = UInt8((hexInt & 0xff0000) >> 16)
    let g = UInt8((hexInt & 0x00ff00) >> 8)
    let b = UInt8(hexInt & 0x0000ff)
    
    
    
    return Pixel(red: r, green: g, blue: b, alpha: 255)
}


fileprivate func randomHTMLColor() -> String {
    var array = HTMLNamedColors.removeKeys(from: htmlNamedColors)
    let randomNum = GKRandomSource.sharedRandom().nextInt(upperBound: array.count)
    return array[randomNum]
    
}

extension String {
     var hexToInt: Int {
        return Int(strtoul(self, nil, 16))
    }
}
