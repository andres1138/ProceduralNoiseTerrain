//
//  ViewController.swift
//  ProceduralNoiseTerrain
//
//  Created by Andre Sarokhanian on 8/19/19.
//  Copyright © 2019 Andre Sarokhanian. All rights reserved.
//

import UIKit
import SpriteKit
import Foundation


class ViewController: UIViewController, StoryboardBound {
    
    @IBOutlet weak var skView: SKView!
    
    
    var savedImage: UIImageView?
    
    let spriteNode = SKSpriteNode()
    
    weak var coordinator: MainCoordinator?
    
    let fileManager = FileManager.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setup2DVC()
        
    }
    
    @IBAction func generate(_ sender: Any) {
        let terrain = TerrainGenerator.generateTerrain(squared: 256)
        spriteNode.size = CGSize(width: 250, height: 250)
        spriteNode.texture = SKTexture(cgImage: terrain.cgImage())
        spriteNode.texture?.filteringMode = .nearest
    }
    
    
   @IBAction func save(_ sender: Any) {
    
    saveImageToDocumentDirectory(image: saveImageRendered(from: skView))
    
        
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
  
    
}



extension ViewController {
    
    
    func setup2DVC() {
        let scene = SKScene(size: skView.bounds.size)
        scene.backgroundColor = UIColor.black
        
        let particle = SKEmitterNode(fileNamed: "stars.sks")
        particle?.position = CGPoint(x: 1000, y: 0)
        particle?.advanceSimulationTime(60)
        particle?.zPosition = -1
        scene.addChild(particle!)
        
        spriteNode.position = CGPoint(x: skView.bounds.size.width/2, y: skView.bounds.size.height/2)
        spriteNode.zPosition = 2
        
        scene.addChild(spriteNode)
        scene.scaleMode = .aspectFit
        
        skView.ignoresSiblingOrder = true
        skView.presentScene(scene)
    }
    
    
    func saveImageRendered(from view: UIView) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: skView.bounds.size)
        let img = renderer.image { context in
            view.drawHierarchy(in: skView.bounds, afterScreenUpdates: true)
            
        }
        return img
    }
    
    
    func saveImageToDocumentDirectory(image: UIImage) {
        var objCBool: ObjCBool = true
        let mainPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0];
        let folderPath = mainPath + "/Screenshots/"
        
        let isExist = FileManager.default.fileExists(atPath: folderPath, isDirectory: &objCBool)
        if !isExist {
            do {
                try FileManager.default.createDirectory(atPath: folderPath, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error)
            }
        }
        
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        print("\(documentDirectory)")
        let imageName = "planet.png"
        let imageUrl = documentDirectory.appendingPathComponent("Screenshots/\(imageName)")
        if let data = image.pngData() {
            do {
                try data.write(to: imageUrl)
                print("Image Saved")
            } catch {
                print("error saving", error)
            }
        }
    }
    
    
    func loadImageFromDocumentDirectory(nameOfImage : String) -> UIImage {
        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let nsUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
        if let dirPath = paths.first{
            let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("Screenshots/\(nameOfImage)")
            guard let image = UIImage(contentsOfFile: imageURL.path) else { return  UIImage.init(named: "fulcrumPlaceholder")!}
            return image
        }
        return UIImage.init(named: "imageDefaultPlaceholder")!
    }
}


