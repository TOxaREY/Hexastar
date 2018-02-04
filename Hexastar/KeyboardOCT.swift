//
//  KeyboardOCT.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 23.01.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import Foundation
import UIKit


class KeyboardOct: UIView {
    
    weak var delegate: KeyboardDelegate?
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeSubviews()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeSubviews()
    }
    func initializeSubviews() {
        let xibFileName = "KeyboardOCT"
        let view = Bundle.main.loadNibNamed(xibFileName, owner: self, options: nil)![0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
    }
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var dot: UIButton!
    @IBOutlet weak var del: UIButton!
    @IBOutlet weak var empty1: UIButton!
    @IBOutlet weak var empty2: UIButton!
    func imageBack(n:UIButton, c:UIImage) {
        n.isSelected = true
        n.setBackgroundImage(c, for: UIControlState.selected)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        n.isSelected = false
        }
    }
    func imageBackAll(z:UIImage,o:UIImage,tw:UIImage,th:UIImage,fo:UIImage,fi:UIImage,si:UIImage,se:UIImage,dott:UIImage,de:UIImage,e1:UIImage,e2:UIImage) {
        imageBack(n: zero, c: z)
        imageBack(n: one, c: o)
        imageBack(n: two, c: tw)
        imageBack(n: three, c: th)
        imageBack(n: four, c: fo)
        imageBack(n: five, c:fi)
        imageBack(n: six, c: si)
        imageBack(n: seven, c:se)
        imageBack(n: dot, c: dott)
        imageBack(n: del, c: de)
        imageBack(n: empty1, c: e1)
        imageBack(n: empty2, c: e2)
    }
    @IBAction func keyTapped(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "0")
       imageBackAll(z: #imageLiteral(resourceName: "red"), o: #imageLiteral(resourceName: "red"), tw: #imageLiteral(resourceName: "blue"), th: #imageLiteral(resourceName: "green"), fo: #imageLiteral(resourceName: "blue"), fi: #imageLiteral(resourceName: "red"), si: #imageLiteral(resourceName: "blue"), se: #imageLiteral(resourceName: "green"), dott: #imageLiteral(resourceName: "green"), de: #imageLiteral(resourceName: "green"), e1: #imageLiteral(resourceName: "red"), e2: #imageLiteral(resourceName: "green"))
        
    }
    @IBAction func keyTapped1(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "1")
        imageBackAll(z: #imageLiteral(resourceName: "red"), o: #imageLiteral(resourceName: "red"), tw: #imageLiteral(resourceName: "red"), th: #imageLiteral(resourceName: "blue"), fo: #imageLiteral(resourceName: "green"), fi: #imageLiteral(resourceName: "blue"), si: #imageLiteral(resourceName: "red"), se: #imageLiteral(resourceName: "blue"), dott: #imageLiteral(resourceName: "green"), de: #imageLiteral(resourceName: "green"), e1: #imageLiteral(resourceName: "blue"), e2: #imageLiteral(resourceName: "green"))
    }
    @IBAction func keyTapped2(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "2")
        imageBackAll(z: #imageLiteral(resourceName: "blue"), o: #imageLiteral(resourceName: "red"), tw: #imageLiteral(resourceName: "red"), th: #imageLiteral(resourceName: "red"), fo: #imageLiteral(resourceName: "green"), fi: #imageLiteral(resourceName: "green"), si: #imageLiteral(resourceName: "blue"), se: #imageLiteral(resourceName: "red"), dott: #imageLiteral(resourceName: "blue"), de: #imageLiteral(resourceName: "blue"), e1: #imageLiteral(resourceName: "green"), e2: #imageLiteral(resourceName: "green"))
        
    }
    @IBAction func keyTapped3(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "3")
        imageBackAll(z: #imageLiteral(resourceName: "green"), o: #imageLiteral(resourceName: "blue"), tw: #imageLiteral(resourceName: "red"), th: #imageLiteral(resourceName: "red"), fo: #imageLiteral(resourceName: "green"), fi: #imageLiteral(resourceName: "green"), si: #imageLiteral(resourceName: "green"), se: #imageLiteral(resourceName: "blue"), dott: #imageLiteral(resourceName: "red"), de: #imageLiteral(resourceName: "red"), e1: #imageLiteral(resourceName: "green"), e2: #imageLiteral(resourceName: "blue"))
    }
    @IBAction func keyTapped4(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "4")
        imageBackAll(z: #imageLiteral(resourceName: "blue"), o: #imageLiteral(resourceName: "green"), tw: #imageLiteral(resourceName: "green"), th: #imageLiteral(resourceName: "green"), fo: #imageLiteral(resourceName: "red"), fi: #imageLiteral(resourceName: "red"), si: #imageLiteral(resourceName: "blue"), se: #imageLiteral(resourceName: "green"), dott: #imageLiteral(resourceName: "green"), de: #imageLiteral(resourceName: "green"), e1: #imageLiteral(resourceName: "red"), e2: #imageLiteral(resourceName: "green"))
        
    }
    @IBAction func keyTapped5(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "5")
        imageBackAll(z: #imageLiteral(resourceName: "red"), o: #imageLiteral(resourceName: "blue"), tw: #imageLiteral(resourceName: "green"), th: #imageLiteral(resourceName: "green"), fo: #imageLiteral(resourceName: "red"), fi: #imageLiteral(resourceName: "red"), si: #imageLiteral(resourceName: "red"), se: #imageLiteral(resourceName: "blue"), dott: #imageLiteral(resourceName: "green"), de: #imageLiteral(resourceName: "green"), e1: #imageLiteral(resourceName: "blue"), e2: #imageLiteral(resourceName: "green"))
        
    }
    @IBAction func keyTapped6(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "6")
        imageBackAll(z: #imageLiteral(resourceName: "blue"), o: #imageLiteral(resourceName: "red"), tw: #imageLiteral(resourceName: "blue"), th: #imageLiteral(resourceName: "green"), fo: #imageLiteral(resourceName: "blue"), fi: #imageLiteral(resourceName: "red"), si: #imageLiteral(resourceName: "red"), se: #imageLiteral(resourceName: "red"), dott: #imageLiteral(resourceName: "blue"), de: #imageLiteral(resourceName: "green"), e1: #imageLiteral(resourceName: "green"), e2: #imageLiteral(resourceName: "green"))
        
    }
    @IBAction func keyTapped7(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "7")
        imageBackAll(z: #imageLiteral(resourceName: "green"), o: #imageLiteral(resourceName: "blue"), tw: #imageLiteral(resourceName: "red"), th: #imageLiteral(resourceName: "blue"), fo: #imageLiteral(resourceName: "green"), fi: #imageLiteral(resourceName: "blue"), si: #imageLiteral(resourceName: "red"), se: #imageLiteral(resourceName: "red"), dott: #imageLiteral(resourceName: "red"), de:#imageLiteral(resourceName: "green"), e1: #imageLiteral(resourceName: "green"), e2: #imageLiteral(resourceName: "blue"))
        
    }
    @IBAction func keyTappedDotta(sender: UIButton) {
        self.delegate?.keyWasTapped(character: ".")
        imageBackAll(z: #imageLiteral(resourceName: "green"), o: #imageLiteral(resourceName: "green"), tw: #imageLiteral(resourceName: "blue"), th: #imageLiteral(resourceName: "red"), fo: #imageLiteral(resourceName: "green"), fi: #imageLiteral(resourceName: "green"), si: #imageLiteral(resourceName: "blue"), se: #imageLiteral(resourceName: "red"), dott: #imageLiteral(resourceName: "red"), de: #imageLiteral(resourceName: "blue"), e1: #imageLiteral(resourceName: "green"), e2: #imageLiteral(resourceName: "red"))
    }
    @IBAction func keyTappedDelete(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "delete")
        imageBackAll(z: #imageLiteral(resourceName: "green"), o: #imageLiteral(resourceName: "green"), tw: #imageLiteral(resourceName: "blue"), th: #imageLiteral(resourceName: "red"), fo: #imageLiteral(resourceName: "green"), fi: #imageLiteral(resourceName: "green"), si: #imageLiteral(resourceName: "green"), se: #imageLiteral(resourceName: "green"), dott: #imageLiteral(resourceName: "blue"), de: #imageLiteral(resourceName: "red"), e1: #imageLiteral(resourceName: "green"), e2: #imageLiteral(resourceName: "red"))
        
    }
    
}



