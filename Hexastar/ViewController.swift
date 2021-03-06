//
//  ViewController.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 16.01.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit
import Foundation

// Start label one view
public var vc1ViewCount = 0


// Change data for iPad
extension NSLayoutConstraint {
    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem!,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
    func setConstant(constant:CGFloat) -> NSLayoutConstraint {
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem!,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}

// Off paste
class NMTextField: UITextField {
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}

class ViewController: UIViewController, KeyboardDelegate {
    var timer: Timer!
    func heightKeyboard() -> Int {
        switch screenHeight {
        case 812: return 203
        case 896: return 224
        default: return Int(screenHeight / (736/224))
        }
    }
    // Error
    func wrong() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "explosionStar"), object: nil)
        pasteButton.isEnabled = true
        copyClearHiddenButton()
        labelRes.text?.removeAll()
        view.endEditing(true)
        let font = UIFont(name: "Xolonium", size: 13.0)!
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.55, green:0.55, blue:0.55, alpha:1.0), NSAttributedString.Key.font: font]
        textField.attributedText = NSAttributedString(string: NSLocalizedString("invalid value", comment: "invalid value") , attributes: attributes)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            self.textField.text?.removeAll()
            switch self.labelTitle.text {
            case "HEXADECIMAL"?: if self.leftKey.isSelected == true {
                self.placeHoldersDec()
            } else {
                self.placeHoldersOct()
                }
            case "OCTAL"?: if self.leftKey.isSelected == true {
                self.placeHoldersDec()
            } else {
                self.placeHoldersHex()
                }
            case "DECIMAL"?: if self.leftKey.isSelected == true {
                self.placeHoldersHex()
            } else {
                self.placeHoldersOct()
                }
            default: break
            }
            
        }
    }
    //
    @IBOutlet weak var textFieldMulti: NSLayoutConstraint!
    func resizeMulti() {
        if screenHeight == 480 {
            let newMultiplier:CGFloat = 1 / 0.85
            textFieldMulti = textFieldMulti.setMultiplier(multiplier: newMultiplier)
        }
    }
    @IBOutlet weak var labelResConst: NSLayoutConstraint!
    func resizeConst() {
        if screenHeight == 480 {
            let newConstant:CGFloat = 44
            labelResConst = labelResConst.setConstant(constant: newConstant)
        }
    }
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelStart: UILabel!
    @IBOutlet weak var leftKey: UIButton!
    @IBOutlet weak var rightKey: UIButton!
    @IBOutlet weak var labelRes: UILabel!
    @IBOutlet weak var copyButton: UIButton!
    @IBOutlet weak var pasteButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var binatrixLabel: UILabel!
    @IBOutlet weak var segueLabel: UILabel!
    @IBOutlet weak var segueButton: UIButton!
    @IBAction func buttonToVC2(_ sender: Any) {
        timer.invalidate()
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let sB: UIStoryboard = UIStoryboard(name: nameStoryboard, bundle: nil)
        let newVC = sB.instantiateViewController(withIdentifier: "VC2")
        appDel.window?.rootViewController = newVC
        appDel.window?.makeKeyAndVisible()
    }
    
    @IBAction func clearButton(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "explosionStar"), object: nil)
        textField.text?.removeAll()
        textField.isEnabled = false
        textLabelTitle()
        labelRes.text?.removeAll()
        leftKey.isSelected = false
        rightKey.isSelected = false
        blackColorButton()
        view.endEditing(true)
    }
    @IBAction func copyButton(_ sender: Any) {
        if labelRes.text?.count != 0 {
            if labelRes.text!.count > 18 {
                var labelRes18:String = ""
                let overCount = labelRes.text!.count - 18
                labelRes18 = String(labelRes.text!.dropLast(overCount))
                UIPasteboard.general.string = labelRes18
            } else {
                UIPasteboard.general.string = labelRes.text
            }
        }
        view.endEditing(true)
    }
    // Paste
    var pasteBoardString: String? = nil
    @IBAction func pasterButton(_ sender: Any) {
        textField.placeholder?.removeAll()
        pasteBoardString = UIPasteboard.general.string?.replacingOccurrences(of: ",", with: ".")
        if leftKey.isSelected != false || rightKey.isSelected != false {
            if pasteBoardString == nil || pasteBoardString == "" {
                wrong()
            } else {
                var i = 0
                for character in pasteBoardString! {
                    if character == "." {
                        i += 1
                    }
                }
                if i > 1 {
                    wrong()
                } else {
                    
                    if pasteBoardString!.count > 13 {
                        let overCount = pasteBoardString!.count - 13
                        pasteBoardString = String(pasteBoardString!.dropLast(overCount))
                    }
                    if ((pasteBoardString)!).count <= 13 {
                        pasteCheck()
                    }
                }
            }
        }
    }
    
    // Check paste for different directions and calculating
    func pasteCheckDec() {
        for i in pasteBoardString! {
            guard i == "0" ||
                i == "1" ||
                i == "2" ||
                i == "3" ||
                i == "4" ||
                i == "5" ||
                i == "6" ||
                i == "7" ||
                i == "8" ||
                i == "9" ||
                i == "." else {
                    wrong()
                    return
            }
        }
        textField.text = pasteBoardString
        switch labelTitle.text {
        case "HEXADECIMAL"?: leftButtonDecHex()
        case "OCTAL"?: leftButtonDecOct()
        default:
            break
        }
    }
    func pasteCheckHex() {
        self.pasteBoardString = pasteBoardString?.uppercased()
        for i in pasteBoardString! {
            guard i == "0" ||
                i == "1" ||
                i == "2" ||
                i == "3" ||
                i == "4" ||
                i == "5" ||
                i == "6" ||
                i == "7" ||
                i == "8" ||
                i == "9" ||
                i == "A" ||
                i == "B" ||
                i == "C" ||
                i == "D" ||
                i == "E" ||
                i == "F" ||
                i == "."  else {
                    wrong()
                    return
            }
        }
        textField.text = pasteBoardString
        switch labelTitle.text {
        case "OCTAL"?: rightButtonHexOct()
        case "DECIMAL"?: leftButtonHexDec()
        default:
            break
        }
    }
    
    func pasteCheckOct() {
        for i in pasteBoardString! {
            guard i == "0" ||
                i == "1" ||
                i == "2" ||
                i == "3" ||
                i == "4" ||
                i == "5" ||
                i == "6" ||
                i == "7" ||
                i == "."  else {
                    wrong()
                    return
            }
        }
        textField.text = pasteBoardString
        switch labelTitle.text {
        case "HEXADECIMAL"?: rightButtonOctHex()
        case "DECIMAL"?: rightButtonOctDec()
        default: break
        }
    }
    func pasteCheck() {
        switch labelTitle.text {
        case "HEXADECIMAL"?: if leftKey.isSelected ==  true {
            pasteCheckDec()
        } else {
            pasteCheckOct()
            }
        case "OCTAL"?: if leftKey.isSelected ==  true {
            pasteCheckDec()
        } else {
            pasteCheckHex()
            }
        case "DECIMAL"?: if leftKey.isSelected ==  true {
            pasteCheckHex()
        } else {
            pasteCheckOct()
            }
        default:
            break
        }
        
    }
    
    // Two dots and the first dot
    func dotta() {
        if textField.text?.count != 0 {
            let startIndex = textField.text?.startIndex
            if textField.text![startIndex!] == "." {
                textField.text?.removeLast()
            }
            var i = 0
            for character in (textField.text!) {
                if character == "."  {
                    i += 1
                }
                if i == 2 {
                    ((textField.text)!).removeLast()
                }
            }
        }
    }
    
    // Tap change heading
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        labelStart.isHidden = true
        if textField.text != NSLocalizedString("invalid value", comment: "invalid value") {
            labelTitleTap()
            keyboardOff()
        }
    }
    var tap = 0
    func labelTitleTap() {
        let fontTitle = UIFont(name: "SFDistantGalaxyAlternate", size: 35.0)!
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: fontTitle]
        switch tap {
        case 0: labelTitle.attributedText = NSAttributedString(string: NSLocalizedString("HEXADECIMAL", comment: "HEXADECIMAL") , attributes: attributes); tap += 1; textLabelTitle()
        case 1: labelTitle.attributedText = NSAttributedString(string: NSLocalizedString("OCTAL", comment: "OCTAL") , attributes: attributes); tap += 1; textLabelTitle()
        case 2: labelTitle.attributedText = NSAttributedString(string: NSLocalizedString("DECIMAL", comment: "DECIMAL") , attributes: attributes); tap = 0; textLabelTitle()
        default: break
        }
        textField.text = ""
        view.endEditing(true)
        selectOff()
        labelButton()
        blackColorButton()
    }
    
    // The caption on the button, depending on the title
    func labelButton() {
        leftKey.reversesTitleShadowWhenHighlighted = true
        rightKey.reversesTitleShadowWhenHighlighted = true
        switch labelTitle.text {
        case "HEXADECIMAL"?: leftKey.setTitle("DEC", for: UIControl.State.normal);
        rightKey.setTitle("OCT", for: UIControl.State.normal)
        case "OCTAL"?: leftKey.setTitle("DEC", for: UIControl.State.normal); rightKey.setTitle("HEX", for: UIControl.State.normal)
        case "DECIMAL"?: leftKey.setTitle("HEX", for: UIControl.State.normal); rightKey.setTitle("OCT", for: UIControl.State.normal)
        default: break
        }
    }
    
    // Start red in button
    func blackColorButton() {
        leftKey.setTitleColor(UIColor(red:0, green:0, blue:0, alpha:1.0), for: UIControl.State.normal)
        leftKey.setTitleShadowColor(UIColor(red:0.89, green:0.01, blue:0.01, alpha:1.0), for: UIControl.State.normal)
        rightKey.setTitleColor(UIColor(red:0, green:0, blue:0, alpha:1.0), for: UIControl.State.normal)
        rightKey.setTitleShadowColor(UIColor(red:0.89, green:0.01, blue:0.01, alpha:1.0), for: UIControl.State.normal)
    }
    // Push button
    @IBAction func leftPush(_ sender: UIButton) {
        labelStart.isHidden = true
        textField.isEnabled = true
        rightKey.isSelected = false
        leftKey.isSelected = true
        leftKey.setTitleColor(UIColor(red:0.89, green:0.01, blue:0.01, alpha:1.0), for: UIControl.State.normal)
        leftKey.setTitleShadowColor(UIColor(red:0, green:0, blue:0, alpha:1.0), for: UIControl.State.normal)
        rightKey.setTitleColor(UIColor(red:0, green:0, blue:0, alpha:0.5), for: UIControl.State.normal)
        rightKey.setTitleShadowColor(UIColor(red:0.89, green:0.01, blue:0.01, alpha:0.5), for: UIControl.State.normal)
        textField.text = ""
        labelRes.text = ""
        copyClearHiddenButton()
        pasteButton.isHidden = false
        view.endEditing(true)
        switch labelTitle.text {
        case "HEXADECIMAL"?: keyboardDec(); placeHoldersDec()
        case "OCTAL"?: keyboardDec(); placeHoldersDec()
        case "DECIMAL"?: keyboardHex(); placeHoldersHex()
        default:
            break
        }
    }
    @IBAction func rightPush(_ sender: UIButton) {
        labelStart.isHidden = true
        textField.isEnabled = true
        leftKey.isSelected = false
        rightKey.isSelected = true
        rightKey.setTitleColor(UIColor(red:0.89, green:0.01, blue:0.01, alpha:1.0), for: UIControl.State.normal)
        rightKey.setTitleShadowColor(UIColor(red:0, green:0, blue:0, alpha:1.0), for: UIControl.State.normal)
        leftKey.setTitleColor(UIColor(red:0, green:0, blue:0, alpha:0.5), for: UIControl.State.normal)
        leftKey.setTitleShadowColor(UIColor(red:0.89, green:0.01, blue:0.01, alpha:0.5), for: UIControl.State.normal)
        textField.text = ""
        labelRes.text = ""
        copyClearHiddenButton()
        pasteButton.isHidden = false
        view.endEditing(true)
        switch labelTitle.text {
        case "HEXADECIMAL"?: keyboardOct(); placeHoldersOct()
        case "OCTAL"?: keyboardHex(); placeHoldersHex()
        case "DECIMAL"?: keyboardOct(); placeHoldersOct()
        default:
            break
        }
    }

    // Label start
    func textLabelTitle() {
        textField.isHidden = true
        copyClearHiddenButton()
        pasteButton.isHidden = true
        leftImage.isHidden = true
        rightImage.isHidden = true
    }
    
    // Placeholders
    func placeHoldersDec() {
        textField.isHidden = false
        let font = UIFont(name: "Xolonium", size: 13.0)!
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.55, green:0.55, blue:0.55, alpha:1.0), NSAttributedString.Key.font: font]
        textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("enter a decimal number", comment: "enter a decimal number"), attributes: attributes)
        imageDontHidden()
    }
    func placeHoldersOct() {
        textField.isHidden = false
        let font = UIFont(name: "Xolonium", size: 13.0)!
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.55, green:0.55, blue:0.55, alpha:1.0), NSAttributedString.Key.font: font]
        textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("enter a octal number", comment: "enter a octal number"), attributes: attributes)
        imageDontHidden()
    }
    func placeHoldersHex() {
        textField.isHidden = false
        let font = UIFont(name: "Xolonium", size: 13.0)!
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.55, green:0.55, blue:0.55, alpha:1.0), NSAttributedString.Key.font: font]
        textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("enter a hexadecimal number", comment: "enter a hexadecimal number"), attributes: attributes)
        imageDontHidden()
    }
    
    // Visibility of pictures on the side of textField
    func imageDontHidden() {
        leftImage.isHidden = false
        rightImage.isHidden = false
    }
    
    // Visibility buttons clear and copy
    func copyClearDontHiddenButton() {
        copyButton.isHidden = false
        clearButton.isHidden = false
    }
    
    // InVisibility buttons clear and copy
    func copyClearHiddenButton() {
        copyButton.isHidden = true
        clearButton.isHidden = true
    }
    
    // Text field and calcilating
    @IBAction func inputTextField(_ sender: Any) {
        textField.placeholder?.removeAll()
        dotta()
        if textField.text!.count > 13 {
            textField.deleteBackward()
        }
        switch labelTitle.text {
        case "HEXADECIMAL"?: leftButtonDecHex(); rightButtonOctHex()
        case "OCTAL"?: leftButtonDecOct(); rightButtonHexOct()
        case "DECIMAL"?: leftButtonHexDec(); rightButtonOctDec()
        default: break
        }
        if textField.text?.count == 0 {
            copyClearHiddenButton()
        }
    }
    func leftButtonDecHex () {
        copyClearDontHiddenButton()
        if textField.text?.count != 0 {
            if leftKey.isSelected == true {
                decHexCalc.inputDecString = textField.text!
                labelRes.text = decHexCalc.decHexFuncTotal()
            }
        } else {
            labelRes.text = ""
            if leftKey.isSelected == true {
                placeHoldersDec()
            }
        }
    }
    func rightButtonOctHex () {
        copyClearDontHiddenButton()
        if textField.text?.count != 0 {
            if rightKey.isSelected == true {
                octDecCalc.inputOctString = textField.text!
                decHexCalc.inputDecString = octDecCalc.octDecConv()
                labelRes.text = decHexCalc.decHexFuncTotal()
            }
        } else {
            labelRes.text = ""
            if rightKey.isSelected == true {
                placeHoldersOct()
            }
        }
    }
    func leftButtonDecOct () {
        copyClearDontHiddenButton()
        if textField.text?.count != 0 {
            if leftKey.isSelected == true {
                decOctCalc.inputDecString = textField.text!
                labelRes.text = decOctCalc.decOctFuncTotal()
            }
        } else {
            labelRes.text = ""
            if leftKey.isSelected == true {
                placeHoldersDec()
            }
        }
    }
    func rightButtonHexOct () {
        copyClearDontHiddenButton()
        if textField.text?.count != 0 {
            if rightKey.isSelected == true {
                hexDecCalc.inputHexString = textField.text!
                decOctCalc.inputDecString = hexDecCalc.hexDecConv()
                labelRes.text = decOctCalc.decOctFuncTotal()
            }
        } else {
            labelRes.text = ""
            if rightKey.isSelected == true {
                placeHoldersHex()
            }
        }
    }
    func leftButtonHexDec () {
        copyClearDontHiddenButton()
        if textField.text?.count != 0 {
            if leftKey.isSelected == true {
                hexDecCalc.inputHexString = textField.text!
                labelRes.text = hexDecCalc.hexDecConv()
            }
        } else {
            labelRes.text = ""
            if leftKey.isSelected == true {
                placeHoldersHex()
            }
        }
    }
    func rightButtonOctDec () {
        copyClearDontHiddenButton()
        if textField.text?.count != 0 {
            if rightKey.isSelected == true {
                octDecCalc.inputOctString = textField.text!
                labelRes.text = octDecCalc.octDecConv()
            }
        } else {
            labelRes.text = ""
            if rightKey.isSelected == true {
                placeHoldersOct()
            }
        }
    }
    
    // Select off in button
    func selectOff() {
        labelRes.text = ""
        leftKey.isSelected = false
        rightKey.isSelected = false
    }

    // Select off keyboard for not push button
    func keyboardOff() {
        if leftKey.isSelected == false && rightKey.isSelected == false {
            textField.isEnabled = false
        }
    }
    // Func vision keyboard delete backward
    func keyWasTapped(character: String) {
        if character == "delete" && (textField.text?.isEmpty)! == true {
            textField.text? = ""
        } else {
            if character == "delete" {
                textField.deleteBackward()
            } else {
                textField.insertText(character)
            }
        }
    }
    
    // Keyboards
    func keyboardHex() {
        let keyboardViewHex = KeyboardHex(frame: CGRect(x: 0, y: 0, width: 0, height: Int(heightKeyboard())))
        keyboardViewHex.delegate = self
        textField.inputView = keyboardViewHex
    }
    func keyboardDec() {
        let keyboardViewDec = KeyboardDec(frame: CGRect(x: 0, y: 0, width: 0, height: Int(heightKeyboard())))
        keyboardViewDec.delegate = self
        textField.inputView = keyboardViewDec
    }
    func keyboardOct() {
        let keyboardViewOct = KeyboardOct(frame: CGRect(x: 0, y: 0, width: 0, height: Int(heightKeyboard())))
        keyboardViewOct.delegate = self
        textField.inputView = keyboardViewOct
    }
    
    // Customer border textField
    func borderTextField() {
        let borderColor : UIColor = UIColor(red:0.55, green:0.55, blue:0.55, alpha:1.0)
        textField.layer.borderWidth = 2
        textField.layer.borderColor = borderColor.cgColor
        textField.layer.cornerRadius = 5.0
        
    }

    // Class calculating
    var decHexCalc = DecHexCalc()
    var hexDecCalc = HexDecCalc()
    var decOctCalc = DecOctCalc()
    var octDecCalc = OctDecCalc()
    
    // Disable & enable buttonBinatrix
    @objc func disableButtonBinatrix() {
        buttonBinatrix.isEnabled = false
    }
    @objc func enableButtonBinatrix() {
        buttonBinatrix.isEnabled = true
    }
    deinit {
        print("VC")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Start label one view
        if vc1ViewCount > 0 {
            labelStart.isHidden = true
        } else {
            vc1ViewCount = 1
        }
        RateManager.showRatesController()
        resizeMulti()
        resizeConst()
        labelTitleTap()
        labelButton()
        keyboardOff()
        NotificationCenter.default.addObserver(self, selector: #selector(disableButtonBinatrix), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(enableButtonBinatrix), name: UIResponder.keyboardDidHideNotification, object: nil)
        textLabelTitle()
        let font = UIFont(name: "Xolonium", size: 18.0)!
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor(red:1.00, green:0.91, blue:0.12, alpha:1.0), NSAttributedString.Key.font: font]
        let font1 = UIFont(name: "Xolonium", size: 13.0)!
        let attributes1 = [NSAttributedString.Key.foregroundColor: UIColor(red:1.00, green:0.91, blue:0.12, alpha:1.0), NSAttributedString.Key.font: font1]
        labelStart.shadowColor = UIColor .black
        labelStart.shadowOffset = CGSize(width: 2, height: 1)
        labelStart.attributedText = NSAttributedString(string: NSLocalizedString("It's time to choose a side conversion! At the top select the format of the result by touching, then select the input format below", comment: "startLabelVC1") , attributes: attributes)
        UITextField.appearance().tintColor = UIColor(red:1.00, green:0.91, blue:0.12, alpha:1.0)
        segueLabel.shadowColor = UIColor .black
        segueLabel.shadowOffset = CGSize(width: 2, height: 1)
        segueLabel.attributedText = NSAttributedString(string: NSLocalizedString("converter Characters <-> Unicode", comment: "converter Characters <-> Unicode") , attributes: attributes1)
        borderTextField()
        runString(string: NSLocalizedString("converter Decimal <-> Binary ", comment: "converter Decimal <-> Binary "))
    }
    // Button to go to another program
    @IBOutlet weak var buttonBinatrix: UIButton!
    @IBAction func buttonBinatrix(_ sender: Any) {
        let appURL = NSURL(string: "binatrixHexastar://")!
        let webURL = NSURL(string: "https://itunes.apple.com/ru/app/binatrix/id1296545616")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL as URL) {
            application.open(appURL as URL)
        } else {
            application.open(webURL as URL)
        }
    }
    
    // Running string
    func runStringArray(string:String) -> ([String]) {
        let myString = string
        var myStringAdd = myString
        var newString:String
        var substring:Substring
        var arrayRunString = [String]()
        myStringAdd.append(String(myString[myString.index(myString.startIndex, offsetBy: 0)..<myString.index(myString.startIndex, offsetBy: 7)]))
        var countString = 0
        for _ in myString {
            countString += 1
        }
        for i in 0...countString - 1 {
            substring = myStringAdd[myStringAdd.index(myStringAdd.startIndex, offsetBy: i)..<myStringAdd.index(myStringAdd.startIndex, offsetBy: i + 7)]
            newString = String(substring)
            arrayRunString.append(newString)
        }
        return arrayRunString
    }
    func runString(string:String) {
        let font = UIFont(name: "Xolonium", size: 13.0)!
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.13, green:0.76, blue:0.05, alpha:1.0), NSAttributedString.Key.font: font]
        let count = runStringArray(string: string).count
        var q = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { (timer) in
            self.binatrixLabel.attributedText = NSAttributedString(string: self.runStringArray(string: string)[q], attributes: attributes)
            q += 1
            if q >= count {
                q = 0
            }
        }
    }
    
    // Touch to any area to remove the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil {
            labelStart.isHidden = true
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
}

