//
//  Flash.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 27.02.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit
import SpriteKit
//// Спираль
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
    let spaceship = SKSpriteNode(imageNamed: "yoda.png")
    let bgr5 = SKSpriteNode(imageNamed: "vcd2-0-5.png")
    let bgr10 = SKTexture(imageNamed: "vcd2-0-10.png")
    let bgr15 = SKTexture(imageNamed: "vcd2-0-15.png")
    let bgr20 = SKTexture(imageNamed: "vcd2-0-20.png")
    let bgr25 = SKTexture(imageNamed: "vcd2-0-25.png")
    let bgr30 = SKTexture(imageNamed: "vcd2-0-30.png")
    let bgr35 = SKTexture(imageNamed: "vcd2-0-35.png")
    let bgr40 = SKTexture(imageNamed: "vcd2-0-40.png")
    let bgr45 = SKTexture(imageNamed: "vcd2-0-45.png")
    let bgr50 = SKTexture(imageNamed: "vcd2-0-50.png")
    override func didMoveToSuperview() {
        let scene = SKScene(size: self.frame.size)
        scene.backgroundColor = UIColor.clear
        self.presentScene(scene)
        self.allowsTransparency = true
        self.backgroundColor = UIColor.clear
        bgr5.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        bgr5.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        bgr5.isHidden = true
        scene.addChild(bgr5)
        let jumper = SKAction.animate(with: [bgr10,bgr15,bgr20,bgr25,bgr30,bgr35,bgr40,bgr45,bgr50], timePerFrame: 0.03)
        
        spaceship.size  = CGSize(width: 30, height: 30)
        spaceship.position = CGPoint(x: (self.frame.size.width / 2) + (self.frame.size.height / 2) - 15, y: self.frame.size.height / 2)
        spaceship.isHidden = true
        scene.addChild(spaceship)
        let downStartPosition = SKAction.scale(to: 0, duration: 0.01)
        let upStartPosition = SKAction.scale(to: CGSize(width: 30, height: 30), duration: 1)
        let scaleNode = SKAction.scale(to: 0.2, duration: 15)
        let spiral = SKAction.spiral(startRadius: (self.frame.size.height / 2) - 15, endRadius: 0, angle: CGFloat(Double.pi) * 6, centerPoint: CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2), duration: 15)
        let rotateNode = SKAction.rotate(toAngle: 15, duration: 15)
        spaceship.run(downStartPosition, completion: {self.spaceship.isHidden = false; self.spaceship.run(upStartPosition, completion: {self.spaceship.run(scaleNode);self.spaceship.run(rotateNode); self.spaceship.run(spiral, completion: {self.spaceship.isHidden = true; self.bgr5.isHidden = false; self.bgr5.run(jumper, completion: {self.bgr5.isHidden = true})})})})

        spaceship.isPaused = true

        NotificationCenter.default.addObserver(self, selector: #selector(start), name: NSNotification.Name(rawValue: "startFlash"), object: nil)
    }
    @objc func start(){
        spaceship.isPaused = false
    }
}

