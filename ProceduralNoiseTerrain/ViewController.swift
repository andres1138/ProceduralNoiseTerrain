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
    
    
    var savedImage: UIImage?
    
    let spriteNode = SKSpriteNode()
    
    weak var coordinator: MainCoordinator?
    
    let fileManager = FileManager.default
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setup2DVC()
        
    }
    
    @IBAction func generate(_ sender: Any) {
        let terrain = TerrainGenerator.generateTerrain(squared: 128)
        spriteNode.size = CGSize(width: 250, height: 250)
        spriteNode.texture = SKTexture(cgImage: terrain.cgImage())
        spriteNode.texture?.filteringMode = .nearest
    }
    
    
   @IBAction func save(_ sender: Any) {
        
        if let image = UIImage(named: "terrain_planet.png") {
            if let data = image.pngData() {
                let filename = getDocumentsDirectory().appendingPathComponent("copy.png")
                try? data.write(to: filename)
            }
        }
        
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    /*
    if let image = UIImage(named: "example.png") {
        if let data = image.jpegData(compressionQuality: 0.8) {
            let filename = getDocumentsDirectory().appendingPathComponent("copy.png")
            try? data.write(to: filename)
        }
    }
    */
    
}



extension ViewController {
    
    @objc func saveImage() {
        
        if let buildingImage = UIImage(named: "planet") {
           
            DispatchQueue.global(qos: .background).async {
                self.store(image: buildingImage, forKey: "wroteimage", storageType: .fileSystem)
            }
        
        }
    }
    
    @objc func display() {
        
        DispatchQueue.global(qos: .background).async {
            
            
            if let savedImage = self.retrieveImage(forKey: "wroteimage", storageType: .fileSystem) {
                
                DispatchQueue.main.async {
                    ///self.savedImageDisplayImageView.image = savedImage
                }
            }
        
        }
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
    
    
    
    private func store(image: UIImage, forKey key: String, storageType: StorageType) {
       
        if let pngRepresentation = image.pngData() {
           
            switch storageType {
            
            case .fileSystem:
                
                if let filePath = filePath(forKey: key) {
                    
                    do  {
                        try pngRepresentation.write(to: filePath, options: .atomic)
                   
                    } catch let error {
                        print("ERROR SAVING FILE: ", error)
                    }
                }
            
            case .userDefaults:
                UserDefaults.standard.set(pngRepresentation, forKey: key)
            }
        }
    }
    
    private func retrieveImage(forKey key: String, storageType: StorageType) -> UIImage? {
       
        switch storageType {
        
        case .fileSystem:
            
            if let filePath = self.filePath(forKey: key),
                let fileData = FileManager.default.contents(atPath: filePath.path),
                let image = UIImage(data: fileData) {
                return image
            }
        
        case .userDefaults:
            
            if let imageData = UserDefaults.standard.object(forKey: key) as? Data,
                let image = UIImage(data: imageData) {
                return image
            }
        }
        
        return nil
    }
    
    
    private func filePath(forKey key: String) -> URL?  {
        let fileManager = FileManager.default
        
        guard let docURL = fileManager.urls(for: .documentDirectory,
                                            in: FileManager.SearchPathDomainMask.userDomainMask).first else { return nil }
        
        return docURL.appendingPathComponent(key + ".png")
    }
    
}


