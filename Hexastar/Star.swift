//
//  Star.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 05.02.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit
import SpriteKit
let π = CGFloat(Double.pi)
extension SKAction {
    static func oscillation(amplitude a: CGFloat, timePeriod t: CGFloat, midPoint: CGPoint) -> SKAction {
        let action = SKAction.customAction(withDuration: Double(t)) { node, currentTime in
            let displacement = a * sin(2 * π * currentTime / t)
            node.position.y = midPoint.y + displacement
        }
        
        return action
    }
}
class Star: SKView {
   let spaceship = SKSpriteNode(imageNamed: "ball.png")
   let explosion = SKSpriteNode(fileNamed: "expl.sks")
   
    override func didMoveToSuperview() {
        let scene = SKScene(size: self.frame.size)
        scene.backgroundColor = UIColor.clear
        self.presentScene(scene)
        self.allowsTransparency = true
        self.backgroundColor = UIColor.clear
        spaceship.position = CGPoint(x: -25, y: 240)
        scene.addChild(spaceship)
        
        let oscillate = SKAction.oscillation(amplitude: 160, timePeriod: 30, midPoint: spaceship.position)
        spaceship.run(SKAction.repeatForever(oscillate))
        let moveRight = SKAction.moveBy(x: 475, y: 0, duration: 20)
        let returnLeft = SKAction.moveBy(x: -475, y: 0, duration: 0.1)
        let seq = SKAction.sequence([moveRight, SKAction.hide(), returnLeft, SKAction.unhide()])
        let loop = SKAction.repeatForever(seq)
        spaceship.run(loop)
        
        explosion?.position = CGPoint(x: spaceship.position.x, y: spaceship.position.y)
        explosion?.isHidden = true
        scene.addChild(explosion!)
        
        NotificationCenter.default.addObserver(self, selector: #selector(explosionStar), name: NSNotification.Name(rawValue: "explosionStar"), object: nil)
    }
    @objc func explosionStar() {
        spaceship.isHidden = true
//        explosion?.run(SKAction.)
    }
  }

