//
//  ViewController.swift
//  ProceduralNoiseTerrain
//
//  Created by Andre Sarokhanian on 8/19/19.
//  Copyright © 2019 Andre Sarokhanian. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController, StoryboardBound {

    
    @IBOutlet weak var skView: SKView!
   
    
    let spriteNode = SKSpriteNode()
    weak var coordinator: MainCoordinator?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setup2DVC()
      
    }

    @IBAction func generate(_ sender: Any) {
        let terrain = TerrainGenerator.generateTerrain(squared: 256)
      
        spriteNode.size = CGSize(width: 300, height: 300)
      
        
        spriteNode.texture = SKTexture(cgImage: terrain.cgImage())
        spriteNode.texture?.filteringMode = .nearest
    }
    @IBAction func save(_ sender: Any) {
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
    
 
     
     
    }


