//
//  Spark.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 19.02.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import Foundation
import SpriteKit
class Touch: SKView {
    let sparki = SKSpriteNode(fileNamed: "sparki.sks")
    let centre = SKSpriteNode(fileNamed: "centre.sks")
    override func didMoveToSuperview() {
        let scene = SKScene(size: self.frame.size)
        scene.backgroundColor = UIColor.clear
        self.presentScene(scene)
        self.allowsTransparency = true
        self.backgroundColor = UIColor.clear
        centre?.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        sparki?.isHidden = true
        scene.addChild(centre!)
        scene.addChild(sparki!)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        var positions = touch?.location(in: self)
        positions = scene?.convertPoint(fromView: positions!)
        sparki?.position = positions!
        sparki?.isHidden = false
        let moveCenter:SKAction
        moveCenter = SKAction.move(to: CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2), duration: 0.5)
        sparki?.run(moveCenter)
        
    }
}

