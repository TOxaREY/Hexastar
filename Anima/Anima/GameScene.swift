//
//  GameScene.swift
//  Anima
//
//  Created by REYNIKOV ANTON on 02.02.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import SpriteKit

let BallCategoryName = "ball"

class GameScene: SKScene, SKPhysicsContactDelegate {

    override func didMove(to view: SKView) {
        
        super.didMove(to: view)

        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)

        borderBody.friction = 0

        self.physicsBody = borderBody
        
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        physicsWorld.contactDelegate = self
        
        let ball = childNode(withName: BallCategoryName) as! SKSpriteNode
        
        ball.physicsBody!.applyImpulse(CGVector(dx: 3, dy: 3))

        
    }

}
    