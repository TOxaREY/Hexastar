//
//  ViewController.swift
//  шар
//
//  Created by REYNIKOV ANTON on 02.02.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit
import SpriteKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let scene = Star(fileNamed: "Star") {
            let skView = self.view as? SKView
            skView?.showsFPS = true
            skView?.showsNodeCount = true
            skView?.ignoresSiblingOrder = true
            scene.scaleMode = .aspectFit
            skView?.presentScene(scene)
        }
    }
        }
        



