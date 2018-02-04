//
//  Star.swift
//  шар
//
//  Created by REYNIKOV ANTON on 02.02.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import SpriteKit
import UIKit
struct PhysicsCategory {
    static let None:        UInt32 = 0      //  0
    static let Edge:        UInt32 = 0b1    //  1
    static let Paddle:      UInt32 = 0b10   //  2
    static let Ball:        UInt32 = 0b100  //  4
}

var paddle: SKSpriteNode!
var ball: SKSpriteNode!

class Star: SKScene, SKPhysicsContactDelegate {
    
    override func didMove(to view: SKView) {

        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
        let edge = SKNode()
        edge.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        edge.physicsBody!.usesPreciseCollisionDetection = true
        edge.physicsBody!.categoryBitMask = PhysicsCategory.Edge
        edge.physicsBody!.friction = 0
        edge.physicsBody!.restitution = 1
        edge.physicsBody!.angularDamping = 0
        edge.physicsBody!.linearDamping = 0
        edge.physicsBody!.isDynamic = false
        addChild(edge)
        
        ball = childNode(withName: "ball") as! SKSpriteNode
        ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2)
        ball.physicsBody!.usesPreciseCollisionDetection = true
        ball.physicsBody!.categoryBitMask = PhysicsCategory.Ball
        ball.physicsBody!.collisionBitMask = PhysicsCategory.Edge | PhysicsCategory.Paddle
        ball.physicsBody!.allowsRotation = false
        ball.physicsBody!.friction = 0
        ball.physicsBody!.restitution = 1
        ball.physicsBody!.angularDamping = 0
        ball.physicsBody!.linearDamping = 0
        physicsWorld.contactDelegate = self
}
}
