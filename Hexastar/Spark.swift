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
    let sparkiLeft = SKSpriteNode(fileNamed: "sparki.sks")
    let sparkiRight = SKSpriteNode(fileNamed: "sparki.sks")
    let centre = SKSpriteNode(fileNamed: "centre.sks")
    var centrePosition = CGPoint()
    var buttonPosition = CGPoint()
    var pickerPositionLeft = CGPoint()
    var pickerPositionRight = CGPoint()
    override func didMoveToSuperview() {
        let scene = SKScene(size: self.frame.size)
        scene.backgroundColor = UIColor.clear
        self.presentScene(scene)
        self.allowsTransparency = true
        self.backgroundColor = UIColor.clear
        centrePosition = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        centre?.position = centrePosition
        sparki?.isHidden = true
        sparkiLeft?.isHidden = true
        sparkiRight?.isHidden = true
        scene.addChild(centre!)
        scene.addChild(sparki!)
        scene.addChild(sparkiLeft!)
        scene.addChild(sparkiRight!)
        NotificationCenter.default.addObserver(self, selector: #selector(buttonShot), name: NSNotification.Name(rawValue: "buttonPush"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(pickerShot), name: NSNotification.Name(rawValue: "pickerPush"), object: nil)
        
    }
    @objc func buttonShot() {
        buttonPosition = (scene?.convertPoint(fromView: CGPointFromString(UserDefaults.standard.object(forKey: "coorButton") as! String)))!
        buttonPosition.x += 15
        buttonPosition.y -= 15
        sparki?.position = buttonPosition
        sparki?.isHidden = false
        let moveCenter:SKAction
        moveCenter = SKAction.move(to: centrePosition, duration: 0.3)
        sparki?.run(moveCenter)
        UserDefaults.standard.removeObject(forKey: "coorButton")
    }
    @objc func pickerShot() {
        pickerPositionLeft = (scene?.convertPoint(fromView: CGPointFromString(UserDefaults.standard.object(forKey: "coorPicker") as! String)))!
        pickerPositionRight = pickerPositionLeft
        pickerPositionRight.x += 180 - 35
        sparkiLeft?.position = pickerPositionLeft
        sparkiRight?.position = pickerPositionRight
        sparkiLeft?.isHidden = false
        sparkiRight?.isHidden = false
        let moveCenter:SKAction
        moveCenter = SKAction.move(to: centrePosition, duration: 0.3)
        sparkiLeft?.run(moveCenter)
        sparkiRight?.run(moveCenter)
        UserDefaults.standard.removeObject(forKey: "coorPicker")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        var positions = touch?.location(in: self)
        positions = scene?.convertPoint(fromView: positions!)
        sparki?.position = positions!
        print(positions!)
        sparki?.isHidden = false
        let moveCenter:SKAction
        moveCenter = SKAction.move(to: centrePosition, duration: 0.3)
        sparki?.run(moveCenter)
    }
}

