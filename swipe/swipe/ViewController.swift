//
//  ViewController.swift
//  swipe
//
//  Created by REYNIKOV ANTON on 21.01.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textF: UITextField!
    @IBOutlet weak var labelF: UILabel!
    @IBOutlet weak var leftKey: UIButton!
    @IBOutlet weak var rightKey: UIButton!
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        labelTitleTap()
    }
    var tap = 0
    func labelTitleTap() {
        switch tap {
        case 0: labelTitle.text = "HEX"; tap += 1
        case 1: labelTitle.text = "OCT"; tap += 1
        case 2: labelTitle.text = "DEC"; tap = 0
        default: break
        }
        textF.text = ""
        view.endEditing(true)
        selectOff()
        labelButton()
    }
    func labelButton() {
        switch labelTitle.text {
        case "HEX"?: leftKey.setTitle("DEC", for: UIControlState.normal); rightKey.setTitle("OCT", for: UIControlState.normal)
        case "OCT"?: leftKey.setTitle("DEC", for: UIControlState.normal); rightKey.setTitle("HEX", for: UIControlState.normal)
        case "DEC"?: leftKey.setTitle("HEX", for: UIControlState.normal); rightKey.setTitle("OCT", for: UIControlState.normal)
        default: break
        }
    }
    @IBAction func leftPush(_ sender: UIButton) {
        rightKey.isSelected = false
        leftKey.isSelected = true
        textF.text = ""
        view.endEditing(true)
        switch labelTitle.text {
        case "HEX"?: leftButtonDecHex()
        case "OCT"?: leftButtonDecOct()
        case "DEC"?: leftButtonHexDec()
        default:
            break
        }
    }
    @IBAction func rightPush(_ sender: UIButton) {
        leftKey.isSelected = false
        rightKey.isSelected = true
        textF.text = ""
        view.endEditing(true)
        switch labelTitle.text {
        case "HEX"?: rightButtonOctHex()
        case "OCT"?: rightButtonHexOct()
        case "DEC"?: rightButtonOctDec()
        default:
             break
    }
}
    
    @IBAction func inputTextField(_ sender: UITextField) {
        switch labelTitle.text {
        case "HEX"?: leftButtonDecHex(); rightButtonOctHex()
        case "OCT"?: leftButtonDecOct(); rightButtonHexOct()
        case "DEC"?: leftButtonHexDec(); rightButtonOctDec()
        default: break
        }
    }
    func leftButtonDecHex () {
        if textF.text?.count != 0 {
            if leftKey.isSelected == true {
                labelF.text = "Dec to Hex"
            }
        } else {
            labelF.text = ""
        }
    }
    func rightButtonOctHex () {
        if textF.text?.count != 0 {
            if rightKey.isSelected == true {
                labelF.text = "Oct to Hex"
            }
        } else {
            labelF.text = ""
        }
    }
    func leftButtonDecOct () {
        if textF.text?.count != 0 {
            if leftKey.isSelected == true {
                labelF.text = "Dec to Oct"
            }
        } else {
            labelF.text = ""
        }
    }
    func rightButtonHexOct () {
        if textF.text?.count != 0 {
            if rightKey.isSelected == true {
                labelF.text = "Hex to Oct"
            }
        } else {
            labelF.text = ""
        }
    }
    func leftButtonHexDec () {
        if textF.text?.count != 0 {
            if leftKey.isSelected == true {
                labelF.text = "Hex to Dec"
            }
        } else {
            labelF.text = ""
        }
    }
    func rightButtonOctDec () {
        if textF.text?.count != 0 {
            if rightKey.isSelected == true {
                labelF.text = "Oct to Dec"
            }
        } else {
            labelF.text = ""
        }
    }
    func selectOff() {
        labelF.text = ""
        leftKey.isSelected = false
        rightKey.isSelected = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitleTap()
        labelButton()
    }
}

