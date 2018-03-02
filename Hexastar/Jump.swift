//
//  Jump.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 25.02.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit
import SpriteKit

class Jump: SKView {
    let sSD = SKSpriteNode(imageNamed: "ssdestroyer")
    let jump3 = SKSpriteNode(imageNamed: "0-3.jpg")
    let jump6 = SKTexture(imageNamed: "0-6.jpg")
    let jump9 = SKTexture(imageNamed: "0-9.jpg")
    let jump12 = SKTexture(imageNamed: "0-12.jpg")
    let jump15 = SKTexture(imageNamed: "0-15.jpg")
    let jump18 = SKTexture(imageNamed: "0-18.jpg")
    let jump21 = SKTexture(imageNamed: "0-21.jpg")
    let jump24 = SKTexture(imageNamed: "0-24.jpg")
    let jump27 = SKTexture(imageNamed: "0-27.jpg")
    let jump30 = SKTexture(imageNamed: "0-30.jpg")
    let jump33 = SKTexture(imageNamed: "0-33.jpg")
    let jump36 = SKTexture(imageNamed: "0-36.jpg")
    let jump39 = SKTexture(imageNamed: "0-39.jpg")
    let jump42 = SKTexture(imageNamed: "0-42.jpg")
    let jump45 = SKTexture(imageNamed: "0-45.jpg")
    let jump48 = SKTexture(imageNamed: "0-48.jpg")
    let jump51 = SKTexture(imageNamed: "0-51.jpg")
    let jump53 = SKTexture(imageNamed: "0-53.jpg")
    let jump56 = SKTexture(imageNamed: "0-56.jpg")
    let jump59 = SKTexture(imageNamed: "0-59.jpg")
    var blue = SKSpriteNode(fileNamed: "blue.sks")!
    var green = SKSpriteNode(fileNamed: "green.sks")!
    var wingUp = SKSpriteNode(imageNamed: "wing1.png")
    var wingMid = SKSpriteNode(imageNamed: "wing2.png")
    
    override func didMoveToSuperview() {
        let scene = SKScene(size: self.frame.size)
        scene.backgroundColor = UIColor.clear
        self.presentScene(scene)
        self.allowsTransparency = true
        self.backgroundColor = UIColor.clear
//// Фон прыжка
        jump3.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        jump3.position = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        jump3.isHidden = true
        scene.addChild(jump3)
////
//// Статичный sSD
        sSD.size = CGSize(width: 806 / 10, height: 500 / 10)
        sSD.position = CGPoint(x: self.frame.size.width / 6.666, y: self.frame.size.height / 1.65)
        sSD.isHidden = true
        scene.addChild(sSD)
////
//// Направление синусоиды
        let moveWingUp:SKAction
        let returnWingUp:SKAction
        moveWingUp = SKAction.moveBy(x: -20, y: -20, duration: 8);
        returnWingUp = SKAction.moveBy(x: 20, y: 20, duration: 8)
        let seqWingUp = SKAction.sequence([moveWingUp,returnWingUp])
        let loopWingUp = SKAction.repeatForever(seqWingUp)
        let moveWingMid:SKAction
        let returnWingMid:SKAction
        moveWingMid = SKAction.moveBy(x: -15, y: 15, duration: 5);
        returnWingMid = SKAction.moveBy(x: 15, y: -15, duration: 5)
        let seqWingMid = SKAction.sequence([moveWingMid,returnWingMid])
        let loopWingMid = SKAction.repeatForever(seqWingMid)
////
//// Правый верхний корабль
        wingUp.size = CGSize(width: 806 / 18, height: 500 / 18)
        wingUp.position = CGPoint(x: self.frame.size.width / 1.176, y: self.frame.size.height / 1.2716)
        wingUp.isHidden = true
        scene.addChild(wingUp)
        let oscillateUp = SKAction.oscillation(amplitude: 5, timePeriod: 3, midPoint: wingUp.position)
        wingUp.run(SKAction.repeatForever(oscillateUp))
        wingUp.run(loopWingUp)
////
//// Правый средний корабль
        wingMid.size = CGSize(width: 806 / 18, height: 400 / 18)
        wingMid.position = CGPoint(x: self.frame.size.width / 1.176, y: self.frame.size.height / 2.2)
        wingMid.isHidden = true
        scene.addChild(wingMid)
        let oscillateMid = SKAction.oscillation(amplitude: 5, timePeriod: 5, midPoint: wingMid.position)
        wingMid.run(SKAction.repeatForever(oscillateMid))
        wingMid.run(loopWingMid)
////
//// Выстрелы
        scene.addChild(blue)
        scene.addChild(green)
        let pauseMid = SKAction.wait(forDuration: 1.6)
        let pauseUpStart = SKAction.wait(forDuration: 2.5)
        blue.position = wingUp.position
        green.position = wingMid.position
        var shot:SKAction
        var shotReturnBlue:SKAction
        var shotReturnGreen:SKAction
        shot = SKAction.move(to: sSD.position, duration: 0.4)
        shotReturnBlue = SKAction.move(to: blue.position, duration: 0.01)
        shotReturnGreen = SKAction.move(to: green.position, duration: 0.01)
        let seqBlue = SKAction.sequence([SKAction.hide(),pauseUpStart,SKAction.unhide(),shot,SKAction.hide(),shotReturnBlue])
        let seqGreen = SKAction.sequence([SKAction.unhide(),shot,SKAction.hide(),pauseMid,shotReturnGreen])
        let loopBlue = SKAction.repeatForever(seqBlue)
        let loopGreen = SKAction.repeatForever(seqGreen)
        blue.run(loopBlue)
        blue.isPaused = true
        green.run(loopGreen)
        green.isPaused = true
////
//// Тряска статичного sSD
        let moveRightUp:SKAction
        let moveDown:SKAction
        let moveLeftUp:SKAction
        moveRightUp = SKAction.moveBy(x: 0.35, y: 0.35, duration: 0.3)
        moveDown = SKAction.moveBy(x: 0, y: -0.7, duration: 0.6)
        moveLeftUp = SKAction.moveBy(x: -0.7, y: 0.7, duration: 0.6)
        let seq = SKAction.sequence([moveRightUp,moveDown,moveLeftUp,moveDown,moveRightUp])
        let loop = SKAction.repeatForever(seq)
        sSD.run(loop)
////
        NotificationCenter.default.addObserver(self, selector: #selector(start), name: NSNotification.Name(rawValue: "start"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(jump), name: NSNotification.Name(rawValue: "jump"), object: nil)

    }
    
        @objc func start(){
            sSD.isHidden = false
            wingUp.isHidden = false
            blue.isPaused = false
            wingMid.isHidden = false
            green.isPaused = false
     }
        @objc func jump(){
            if sSD.size == CGSize(width: 806 / 10, height: 500 / 10) {
                wingUp.isHidden = true
                wingMid.isHidden = true
                blue.removeFromParent()
                green.removeFromParent()
                let moveCentre:SKAction
                let returnMove:SKAction
                moveCentre = SKAction.moveBy(x: self.frame.size.width / 1.3571 - self.frame.size.width / 6.666, y: -(self.frame.size.height / 1.65 - self.frame.size.height / 3.155), duration: 0.7)
                returnMove = SKAction.moveBy(x: -(self.frame.size.width / 1.3571 - self.frame.size.width / 6.666), y: self.frame.size.height / 1.65 - self.frame.size.height / 3.155, duration: 0.01)
                let seq = SKAction.sequence([moveCentre, SKAction.hide(), returnMove, SKAction.unhide()])
            let jumper = SKAction.animate(with: [jump6,jump9,jump12,jump15,jump18,jump21,jump24,jump27,jump30,jump33,jump36,jump39,jump42,jump45,jump48,jump51,jump51,jump53,jump56,jump59], timePerFrame: 0.035)
            let moveCentreAktion = SKAction.scale(to: 0, duration: 0.7)
            let moveReturnAktion = SKAction.scale(to: CGSize(width: 806 / 10, height: 500 / 10), duration: 0.33)
            let pauseJ = SKAction.wait(forDuration: 1.5)
                jump3.isHidden = false            
//// Динамика фона
                jump3.run(jumper, completion: {self.jump3.isHidden = true})
////
//// Динамика уменьшения sSD
                sSD.run(moveCentreAktion)
////
//// Динамика движения sSD
                sSD.run(seq, completion: {self.sSD.run(pauseJ,completion: {self.sSD.run(moveReturnAktion, completion: {self.sSD.isHidden = true; self.wingUp.isHidden = false; self.wingMid.isHidden = false; self.scene?.addChild(self.blue);self.scene?.addChild(self.green); self.sSD.isHidden = false})})})
////
        }
    }

}
