//
//  KeyboardHEX.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 17.01.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import Foundation
import UIKit


protocol KeyboardDelegate: class {
    func keyWasTapped(character: String)
}

class KeyboardHex: UIView {
    
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
        let xibFileName = "KeyboardHEX"
        let view = Bundle.main.loadNibNamed(xibFileName, owner: self, options: nil)![0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
    }
    @IBAction func keyTapped(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "0")
    }
    @IBAction func keyTapped1(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "1")
    }
    @IBAction func keyTapped2(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "2")
    }
    @IBAction func keyTapped3(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "3")
    }
    @IBAction func keyTapped4(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "4")
    }
    @IBAction func keyTapped5(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "5")
    }
    @IBAction func keyTapped6(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "6")
    }
    @IBAction func keyTapped7(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "7")
    }
    @IBAction func keyTapped8(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "8")
    }
    @IBAction func keyTapped9(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "9")
    }
    @IBAction func keyTappedA(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "A")
    }
    @IBAction func keyTappedB(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "B")
    }
    @IBAction func keyTappedC(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "C")
    }
    @IBAction func keyTappedD(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "D")
    }
    @IBAction func keyTappedE(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "E")
    }
    @IBAction func keyTappedF(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "F")
    }
    @IBAction func keyTappedDotta(sender: UIButton) {
        self.delegate?.keyWasTapped(character: ".")
    }
    @IBAction func keyTappedDelete(sender: UIButton) {
        self.delegate?.keyWasTapped(character: "delete")
    }
}

