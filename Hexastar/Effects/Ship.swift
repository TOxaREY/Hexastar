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
    let spaceship = SKSpriteNode(imageNamed: "ship.png")
    deinit {
        print("ShipVC")
    }
    override func didMoveToSuperview() {
        let scene = SKScene(size: self.frame.size)
        scene.backgroundColor = UIColor.clear
        self.presentScene(scene)
        self.allowsTransparency = true
        self.backgroundColor = UIColor.clear
        spaceship.size  = CGSize(width: 60, height: 60)
        spaceship.position = CGPoint(x: 410, y: self.frame.size.height / 2)
        scene.addChild(spaceship)
        let oscillate = SKAction.oscillation(amplitude: 40, timePeriod: 5, midPoint: spaceship.position)
        spaceship.run(SKAction.repeatForever(oscillate))
        let moveRight:SKAction
        let returnLeft:SKAction
        moveRight = SKAction.moveBy(x: -430, y: 0, duration: 13)
        returnLeft = SKAction.moveBy(x: 430, y: 0, duration: 0.1)
        let seq = SKAction.sequence([moveRight, SKAction.hide(), returnLeft, SKAction.unhide()])
        let loop = SKAction.repeatForever(seq)
        spaceship.run(loop)
    }
}
