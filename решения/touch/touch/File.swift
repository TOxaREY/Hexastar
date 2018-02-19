//
//  File.swift
//  touch
//
//  Created by REYNIKOV ANTON on 18.02.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import Foundation
import SpriteKit
var sparki = SKSpriteNode(imageNamed: "ball.png")
class Touch: SKView {
    override func didMoveToSuperview() {
        let scene = SKScene(size: self.frame.size)
        scene.backgroundColor = UIColor.clear
        self.presentScene(scene)
        self.allowsTransparency = true
        self.backgroundColor = UIColor.clear
        sparki.size = CGSize(width: 20, height: 20)
        sparki.isHidden = true
        scene.addChild(sparki)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            let touch = touches.first
            var positions = touch?.location(in: self)
            positions = scene?.convertPoint(fromView: positions!)
            sparki.isHidden = false
            sparki.position = positions!
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            sparki.isHidden = true
    }
}
