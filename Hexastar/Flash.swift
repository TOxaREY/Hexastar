//
//  Flash.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 27.02.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit
import SpriteKit
//// Spiral
func pointOnCircle(angle: CGFloat, radius: CGFloat, center: CGPoint) -> CGPoint {
    return CGPoint(x: center.x + radius * cos(angle),
                   y: center.y + radius * sin(angle))
}
extension SKAction {
    static func spiral(startRadius: CGFloat, endRadius: CGFloat, angle totalAngle: CGFloat, centerPoint: CGPoint, duration: TimeInterval) -> SKAction {
        let radiusPerRevolution = (endRadius - startRadius) / totalAngle
        let action = SKAction.customAction(withDuration: duration) { node, time in
        let θ = totalAngle * time / CGFloat(duration)
        let radius = startRadius + radiusPerRevolution * θ
        node.position = pointOnCircle(angle: θ, radius: radius, center: centerPoint)
        }
        return action
    }
}
////
class Flash: SKView {
    let dMNode = SKSpriteNode(imageNamed: "dM.png")
    let eGNode = SKSpriteNode(imageNamed: "eG.png")
    let kRNode = SKSpriteNode(imageNamed: "kR.png")
    let yDNode = SKSpriteNode(imageNamed: "yD.png")
    let hSNode = SKSpriteNode(imageNamed: "hS.png")
    let cWNode = SKSpriteNode(imageNamed: "cW.png")
    let bH = SKSpriteNode(fileNamed: "blackhole.sks")!
    override func didMoveToSuperview() {
        let scene = SKScene(size: self.frame.size)
        scene.backgroundColor = UIColor.clear
        self.presentScene(scene)
        self.allowsTransparency = true
        self.backgroundColor = UIColor.clear
        bH.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        scene.addChild(bH)
        let downStartPosition = SKAction.scale(to: 0, duration: 0.01)
        let upStartPosition = SKAction.scale(to: CGSize(width: 45, height: 45), duration: 1)
        let scaleNode = SKAction.scale(to: 0.2, duration: 15)
        let rotateNode = SKAction.rotate(byAngle: CGFloat(Double.pi * 12), duration: 15)
        let spiral = SKAction.spiral(startRadius: (self.frame.size.height / 2) - 15, endRadius: 0, angle: CGFloat(Double.pi) * 6, centerPoint: CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2), duration: 15)
        let returnStart = SKAction.moveBy(x: (self.frame.size.height / 2) - 15 , y: 0, duration: 0.01)
        
        
        func addNodeStart(node: SKSpriteNode, timer: TimeInterval) {
            node.size  = CGSize(width: 45, height: 45)
            node.position = CGPoint(x: (self.frame.size.width / 2) + (self.frame.size.height / 2) - 15, y: self.frame.size.height / 2)
            scene.addChild(node)
            let seq01 = SKAction.sequence([SKAction.hide(),SKAction.wait(forDuration: timer),downStartPosition,SKAction.unhide(),upStartPosition,SKAction.wait(forDuration: 15.01 + 32.04)])
            let seq02 = SKAction.sequence([SKAction.wait(forDuration: timer),SKAction.wait(forDuration: 1.01),scaleNode,SKAction.wait(forDuration: 0.01 + 32.04)])
            let seq03 = SKAction.sequence([SKAction.wait(forDuration: timer),SKAction.wait(forDuration: 1.01),rotateNode,SKAction.wait(forDuration: 0.01 + 32.04)])
            let seq04 = SKAction.sequence([SKAction.wait(forDuration: timer),SKAction.wait(forDuration: 1.01),spiral,SKAction.hide(),returnStart,SKAction.wait(forDuration: 32.04)])
             let seq1 = SKAction.sequence([SKAction.hide(),downStartPosition,SKAction.unhide(),upStartPosition,SKAction.wait(forDuration: 15.01 + 32.04)])
             let seq2 = SKAction.sequence([SKAction.wait(forDuration: 1.01),scaleNode,SKAction.wait(forDuration: 0.01 + 32.04)])
             let seq3 = SKAction.sequence([SKAction.wait(forDuration: 1.01),rotateNode,SKAction.wait(forDuration: 0.01 + 32.04)])
             let seq4 = SKAction.sequence([SKAction.wait(forDuration: 1.01),spiral,SKAction.hide(),returnStart,SKAction.wait(forDuration: 32.04)])
            let seq11 = SKAction.sequence([seq01,SKAction.repeatForever(seq1)])
            let seq12 = SKAction.sequence([seq02,SKAction.repeatForever(seq2)])
            let seq13 = SKAction.sequence([seq03,SKAction.repeatForever(seq3)])
            let seq14 = SKAction.sequence([seq04,SKAction.repeatForever(seq4)])
            node.run(seq11)
            node.run(seq12)
            node.run(seq13)
            node.run(seq14)
        }
        addNodeStart(node: yDNode, timer: 0)
        addNodeStart(node: kRNode, timer: 8.01)
        addNodeStart(node: cWNode, timer: 8.01 * 2)
        addNodeStart(node: dMNode, timer: 8.01 * 3)
        addNodeStart(node: hSNode, timer: 8.01 * 4)
        addNodeStart(node: eGNode, timer: 8.01 * 5) 
    }
}

