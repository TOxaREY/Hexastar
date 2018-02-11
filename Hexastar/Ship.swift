//
//  Ship.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 08.02.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit
import SpriteKit

class Ship: SKView {
    
    override func didMoveToSuperview() {
        let spaceship = SKSpriteNode(imageNamed: "ship.png")
        let scene = SKScene(size: self.frame.size)
        scene.backgroundColor = UIColor.clear
        self.presentScene(scene)
        self.allowsTransparency = true
        self.backgroundColor = UIColor.clear
        switch screenHeight {
        case 812: spaceship.position = CGPoint(x: 450, y: 102)
        case 736: spaceship.position = CGPoint(x: 489, y: 112)
        case 667: spaceship.position = CGPoint(x: 450, y: 102)
        case 568: spaceship.position = CGPoint(x: 395, y: 86)
        default:
            spaceship.position = CGPoint(x: 415, y: 0)
        }
        scene.addChild(spaceship)
        
        let oscillate = SKAction.oscillation(amplitude: 55, timePeriod: 5, midPoint: spaceship.position)
        spaceship.run(SKAction.repeatForever(oscillate))
        let moveRight:SKAction
        let returnLeft:SKAction
        switch screenHeight {
        case 812: moveRight = SKAction.moveBy(x: -475, y: 0, duration: 13);
        returnLeft = SKAction.moveBy(x: 475, y: 0, duration: 0.1)
        case 736: moveRight = SKAction.moveBy(x: -514, y: 0, duration: 13);
        returnLeft = SKAction.moveBy(x: 514, y: 0, duration: 0.1)
        case 667: moveRight = SKAction.moveBy(x: -475, y: 0, duration: 13);
        returnLeft = SKAction.moveBy(x: 475, y: 0, duration: 0.1)
        case 568: moveRight = SKAction.moveBy(x: -420, y: 0, duration: 13);
        returnLeft = SKAction.moveBy(x: 420, y: 0, duration: 0.1)
        default:
            moveRight = SKAction.moveBy(x: -475, y: 0, duration: 13);
            returnLeft = SKAction.moveBy(x: 475, y: 0, duration: 0.1)
        }
        let seq = SKAction.sequence([moveRight, SKAction.hide(), returnLeft, SKAction.unhide()])
        let loop = SKAction.repeatForever(seq)
        spaceship.run(loop)
    }
}
