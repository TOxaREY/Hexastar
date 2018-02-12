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
    let expStart = SKSpriteNode(imageNamed: "ballStart.png")
    let expFrame1 = SKTexture(imageNamed: "ball 1.png")
    let expFrame2 = SKTexture(imageNamed: "ball 2.png")
    let expFrame3 = SKTexture(imageNamed: "ball 3.png")
    let expFrame3a = SKTexture(imageNamed: "ball 3a.png")
    let expFrame3b = SKTexture(imageNamed: "ball 3b.png")
    let expFrame4 = SKTexture(imageNamed: "ball 4.png")
    let expFrame5 = SKTexture(imageNamed: "ball 5.png")
    let expFrame6 = SKTexture(imageNamed: "ball 6.png")
    let expFrame7 = SKTexture(imageNamed: "ball 7.png")
    let expFrame8 = SKTexture(imageNamed: "ball 8.png")
    let expFrame9 = SKTexture(imageNamed: "ball 9.png")
    let expFrame10 = SKTexture(imageNamed: "ball 10.png")
    let expFrame11 = SKTexture(imageNamed: "ball 11.png")
    let expFrame12 = SKTexture(imageNamed: "ball 12.png")
    let expFrame13 = SKTexture(imageNamed: "ball 13.png")
    let expFrame14 = SKTexture(imageNamed: "ball 14.png")
   
    override func didMoveToSuperview() {
        let scene = SKScene(size: self.frame.size)
        scene.backgroundColor = UIColor.clear
        self.presentScene(scene)
        self.allowsTransparency = true
        self.backgroundColor = UIColor.clear
        switch screenHeight {
        case 812: spaceship.position = CGPoint(x: -25, y: 282)
        case 736: spaceship.position = CGPoint(x: -25, y: 254)
        case 667: spaceship.position = CGPoint(x: -25, y: 227)
        case 568: spaceship.position = CGPoint(x: -25, y: 188)
        default:
            spaceship.position = CGPoint(x: -25, y: screenHeight * 0.3388)
        }
        scene.addChild(spaceship)
        
        let oscillate = SKAction.oscillation(amplitude: 160, timePeriod: 30, midPoint: spaceship.position)
        spaceship.run(SKAction.repeatForever(oscillate))
        let moveRight:SKAction
        let returnLeft:SKAction
        switch screenHeight {
        case 812: moveRight = SKAction.moveBy(x: 475, y: 0, duration: 20);
        returnLeft = SKAction.moveBy(x: -475, y: 0, duration: 0.1)
        case 736: moveRight = SKAction.moveBy(x: 504, y: 0, duration: 20);
        returnLeft = SKAction.moveBy(x: -504, y: 0, duration: 0.1)
        case 667: moveRight = SKAction.moveBy(x: 475, y: 0, duration: 20);
        returnLeft = SKAction.moveBy(x: -475, y: 0, duration: 0.1)
        case 568: moveRight = SKAction.moveBy(x: 420, y: 0, duration: 20);
        returnLeft = SKAction.moveBy(x: -420, y: 0, duration: 0.1)
        default:
            moveRight = SKAction.moveBy(x: 504, y: 0, duration: 20);
            returnLeft = SKAction.moveBy(x: -504, y: 0, duration: 0.1)
        }
        let seq = SKAction.sequence([moveRight, SKAction.hide(), returnLeft, SKAction.unhide()])
        let loop = SKAction.repeatForever(seq)
        spaceship.run(loop)

        expStart.isHidden = true
        scene.addChild(expStart)
        
        NotificationCenter.default.addObserver(self, selector: #selector(explosionStar), name: NSNotification.Name(rawValue: "explosionStar"), object: nil)
        
    }
            @objc func explosionStar() {
                if spaceship.isHidden == false {
                    let animateExplosion = SKAction.animate(with: [expFrame1,expFrame2,expFrame3,expFrame3a,expFrame3b,expFrame4,expFrame5,expFrame6,expFrame7,expFrame8,expFrame9,expFrame10,expFrame11,expFrame12,expFrame13,expFrame14], timePerFrame: 0.1)
                    spaceship.isHidden = true
                    expStart.position = CGPoint(x: self.spaceship.position.x, y: self.spaceship.position.y)
                    expStart.isHidden = false
                    expStart.run(animateExplosion, completion: {self.expStart.isHidden = true})
          }
    }
}


