//
//  Jump.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 25.02.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit
import SpriteKit

class Jump: SKView {
    
    override func didMoveToSuperview() {
        let jump3 = SKSpriteNode(imageNamed: "0-3.png")
        let jump6 = SKTexture(imageNamed: "0-6.png")
        let jump9 = SKTexture(imageNamed: "0-9.png")
        let jump12 = SKTexture(imageNamed: "0-12.png")
        let jump15 = SKTexture(imageNamed: "0-15.png")
        let jump18 = SKTexture(imageNamed: "0-18.png")
        let jump21 = SKTexture(imageNamed: "0-21.png")
        let jump24 = SKTexture(imageNamed: "0-24.png")
        let jump27 = SKTexture(imageNamed: "0-27.png")
        let jump30 = SKTexture(imageNamed: "0-30.png")
        let jump33 = SKTexture(imageNamed: "0-33.png")
        let jump36 = SKTexture(imageNamed: "0-36.png")
        let jump39 = SKTexture(imageNamed: "0-39.png")
        let jump42 = SKTexture(imageNamed: "0-42.png")
        let jump45 = SKTexture(imageNamed: "0-45.png")
        let jump48 = SKTexture(imageNamed: "0-48.png")
        let jump51 = SKTexture(imageNamed: "0-51.png")
        let jump53 = SKTexture(imageNamed: "0-53.png")
        let jump56 = SKTexture(imageNamed: "0-56.png")
        let jump59 = SKTexture(imageNamed: "0-59.png")
        let jump62 = SKTexture(imageNamed: "0-62.png")
        let jump65 = SKTexture(imageNamed: "0-65.png")
        let jump68 = SKTexture(imageNamed: "0-68.png")
        let jump71 = SKTexture(imageNamed: "0-71.png")
        let jump74 = SKTexture(imageNamed: "0-74.png")
        let jump77 = SKTexture(imageNamed: "0-77.png")
        let jump80 = SKTexture(imageNamed: "0-80.png")
        let jump83 = SKTexture(imageNamed: "0-83.png")
        let scene = SKScene(size: self.frame.size)
        scene.backgroundColor = UIColor.clear
        self.presentScene(scene)
        self.allowsTransparency = true
        self.backgroundColor = UIColor.clear
        jump3.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        jump3.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        scene.addChild(jump3)
        let jumper = SKAction.animate(with: [jump6,jump9,jump12,jump15,jump18,jump21,jump24,jump27,jump30,jump33,jump36,jump39,jump42,jump45,jump48,jump51,jump51,jump53,jump56,jump59,jump62,jump65,jump68,jump71,jump74,jump77,jump80,jump83], timePerFrame: 0.1)
        jump3.run(jumper, completion: {jump3.isHidden = true})
    }
}
