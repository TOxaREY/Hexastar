//
//  ViewController.swift
//  Line
//
//  Created by REYNIKOV ANTON on 02.02.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit
class DrawExamples: UIView {
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(3.0)
        context?.setShadow(offset: CGSize(width: 1, height: 1), blur: 0.01, color: UIColor.blue.cgColor)
        context?.setStrokeColor(UIColor.red.cgColor)
        context?.move(to: CGPoint(x: 30, y: 30))
        context?.addLine(to: CGPoint(x: 150, y: 320))
        context?.strokePath()
     }
}
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

