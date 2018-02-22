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
    let deathStar = SKSpriteNode(imageNamed: "deathStar.png")
    let sparki = SKSpriteNode(fileNamed: "sparki.sks")!
    let sparkiLeft = SKSpriteNode(fileNamed: "sparkiLR.sks")!
    let sparkiRight = SKSpriteNode(fileNamed: "sparkiLR.sks")!
    let centre = SKSpriteNode(fileNamed: "centre.sks")!
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
        deathStar.size = CGSize(width: 60, height: 60)
        centrePosition = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        centre.position = centrePosition
        deathStar.position = centrePosition
        sparki.isHidden = true
        sparkiLeft.isHidden = true
        sparkiRight.isHidden = true
        deathStar.isHidden = true
        centre.isHidden = true
        scene.addChild(deathStar)
        scene.addChild(centre)
        scene.addChild(sparki)
        scene.addChild(sparkiLeft)
        scene.addChild(sparkiRight)
//// Тряска
        let moveRightUp:SKAction
        let moveDown:SKAction
        let moveLeftUp:SKAction
        let moveZero:SKAction
        moveRightUp = SKAction.moveBy(x: 1, y: 1, duration: 0.01)
        moveDown = SKAction.moveBy(x: 0, y: -2, duration: 0.02)
        moveLeftUp = SKAction.moveBy(x: -2, y: 2, duration: 0.02)
        moveZero = SKAction.moveBy(x: 0, y: 0, duration: 1)
        let seq1 = SKAction.sequence([moveRightUp,moveDown,moveLeftUp,moveDown,moveRightUp])
        let seq = SKAction.sequence([SKAction.repeat(seq1, count: 10),moveZero])
        let loop = SKAction.repeatForever(seq)
        deathStar.run(loop)
////
//// Стрельба
        NotificationCenter.default.addObserver(self, selector: #selector(buttonShot), name: NSNotification.Name(rawValue: "buttonPush"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(pickerShot), name: NSNotification.Name(rawValue: "pickerPush"), object: nil)
    }
////
//// Стрельба из кнопок
    @objc func buttonShot() {
        deathStar.isHidden = false
        centre.isHidden = false
        buttonPosition = (scene?.convertPoint(fromView: CGPointFromString(UserDefaults.standard.string(forKey: "coorButton")!)))!
        buttonPosition.x += 15
        buttonPosition.y -= 15
        sparki.position = buttonPosition
        sparki.isHidden = false
        let moveCenter:SKAction
        moveCenter = SKAction.move(to: centrePosition, duration: 0.4)
        sparki.run(moveCenter, completion: {self.sparki.isHidden = true})
    }
////
//// Стрельба из пикеров
    @objc func pickerShot() {
        pickerPositionLeft = (scene?.convertPoint(fromView: CGPointFromString(UserDefaults.standard.string(forKey: "coorPicker")!)))!
        pickerPositionRight = pickerPositionLeft
        pickerPositionRight.x += CGFloat(UserDefaults.standard.integer(forKey: "wigth")) - 30
        sparkiLeft.position = pickerPositionLeft
        sparkiRight.position = pickerPositionRight
        sparkiLeft.isHidden = false
        sparkiRight.isHidden = false
        let moveCenter:SKAction
        moveCenter = SKAction.move(to: centrePosition, duration: 0.4)
        sparkiLeft.run(moveCenter, completion: {self.sparkiLeft.isHidden = true})
        sparkiRight.run(moveCenter, completion: {self.sparkiRight.isHidden = true})
    }
////
//// Стрельба из тачей
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        deathStar.isHidden = false
        centre.isHidden = false
        let touch = touches.first
        var positions = touch?.location(in: self)
        positions = scene?.convertPoint(fromView: positions!)
        sparki.position = positions!
        sparki.isHidden = false
        let moveCenter:SKAction
        moveCenter = SKAction.move(to: centrePosition, duration: 0.4)
        sparki.run(moveCenter, completion: {self.sparki.isHidden = true})
    }
////
}

