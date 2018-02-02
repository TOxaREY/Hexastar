//
//  ViewController.swift
//  Anima
//
//  Created by REYNIKOV ANTON on 01.02.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var box : UIView?
    
    func addBox(location: CGRect) {
        let newBox = UIView(frame: location)
        newBox.backgroundColor = UIColor.red
        
        view.insertSubview(newBox, at: 0)
        box = newBox
    }
    var animator:UIDynamicAnimator? = nil
    let gravity = UIGravityBehavior()
    let collider = UICollisionBehavior()
    func createAnimatorStuff() {
        animator = UIDynamicAnimator(referenceView:self.view)
        animator?.addBehavior(collider)
        
        gravity.addItem(box!)
        gravity.gravityDirection = CGVector(dx: 5, dy: 5)
        animator?.addBehavior(gravity)
        collider.addItem(box!)
        collider.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(collider)
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        addBox(location: CGRect(x: 100, y: 100, width: 30, height: 30))
        createAnimatorStuff()
        
        
        
    }




}

