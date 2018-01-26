//
//  ViewController.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 16.01.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit
import Foundation
//// Мигание йоды
extension UIImageView {
    func flash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 1
        flash.fromValue = 1
        flash.toValue = 0
        flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 1000000
        layer.add(flash, forKey: nil)
    }
}
////
//// Определение высоты девайса
public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}
func heightKeyboard() -> Int {
    if screenHeight == 812 {
        return 203
    } else {
        return Int(screenHeight / (736/224))
    }
}
////
class ViewController: UIViewController, KeyboardDelegate {
//// Блокировка поворота
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    override var shouldAutorotate: Bool {
        return false
    }
////
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var leftKey: UIButton!
    @IBOutlet weak var rightKey: UIButton!
    @IBOutlet weak var labelRes: UILabel!
    @IBOutlet weak var leftYoda: UIImageView!
    @IBOutlet weak var rightYoda: UIImageView!

//// Положение поля ввода
    func constraintTextField() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        switch screenHeight {
        case 736: textField.bottomAnchor.constraint(equalTo: textField.superview!.bottomAnchor, constant: -127).isActive = true
        case 812: textField.bottomAnchor.constraint(equalTo: textField.superview!.bottomAnchor, constant: -166).isActive = true
        case 667: textField.bottomAnchor.constraint(equalTo: textField.superview!.bottomAnchor, constant: -111).isActive = true
        case 568: textField.bottomAnchor.constraint(equalTo: textField.superview!.bottomAnchor, constant: -87).isActive = true
        default: break
        }
         textField.bottomAnchor.constraint(equalTo: textField.superview!.bottomAnchor, constant: -87).isActive = true
    }
////
//// Нажатие меняет заголовок
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        labelTitleTap()
        keyboardOff()
    }
    var tap = 0
    func labelTitleTap() {
        let fontTitle = UIFont(name: "StarJediOutline", size: 30.0)!
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.font: fontTitle]
        switch tap {
        case 0: labelTitle.attributedText = NSAttributedString(string: NSLocalizedString("hexadecimal", comment: "hexadecimal") , attributes: attributes); tap += 1
        case 1: labelTitle.attributedText = NSAttributedString(string: NSLocalizedString("octal", comment: "octal") , attributes: attributes); tap += 1
        case 2: labelTitle.attributedText = NSAttributedString(string: NSLocalizedString("decimal", comment: "decimal") , attributes: attributes); tap = 0
        default: break
        }
        textField.text = ""
        view.endEditing(true)
        selectOff()
        labelButton()
    }
////
//// Надпись на кнопке в зависисмоти от заголовка
    func labelButton() {
        switch labelTitle.text {
        case "hexadecimal"?: leftKey.setTitle("DEC", for: UIControlState.normal); rightKey.setTitle("OCT", for: UIControlState.normal)
        case "octal"?: leftKey.setTitle("DEC", for: UIControlState.normal); rightKey.setTitle("HEX", for: UIControlState.normal)
        case "decimal"?: leftKey.setTitle("HEX", for: UIControlState.normal); rightKey.setTitle("OCT", for: UIControlState.normal)
        default: break
        }
    }
////
//// Нажатие кнопок
    @IBAction func leftPush(_ sender: UIButton) {
        textField.isEnabled = true
        rightKey.isSelected = false
        leftKey.isSelected = true
        textField.text = ""
        labelRes.text = ""
        view.endEditing(true)
        switch labelTitle.text {
        case "hexadecimal"?: keyboardDec()
        case "octal"?: keyboardDec()
        case "decimal"?: keyboardHex()
        default:
            break
        }
    }
    @IBAction func rightPush(_ sender: UIButton) {
        textField.isEnabled = true
        leftKey.isSelected = false
        rightKey.isSelected = true
        textField.text = ""
        labelRes.text = ""
        view.endEditing(true)
        switch labelTitle.text {
        case "hexadecimal"?: keyboardOct()
        case "octal"?: keyboardHex()
        case "decimal"?: keyboardOct()
        default:
            break
        }
    }
////
//// Поле ввода зависимость от заголовка выдает направление конвертирования
    @IBAction func inputTextField(_ sender: Any) {
        if textField.text!.count > 13 {
            textField.text?.removeLast()
        }
        switch labelTitle.text {
        case "hexadecimal"?: leftButtonDecHex(); rightButtonOctHex()
        case "octal"?: leftButtonDecOct(); rightButtonHexOct()
        case "decimal"?: leftButtonHexDec(); rightButtonOctDec()
        default: break
        }
    }
    func leftButtonDecHex () {
        if textField.text?.count != 0 {
            if leftKey.isSelected == true {
                decHexCalc.inputDecString = textField.text!
                labelRes.text = decHexCalc.decHexFuncTotal()
            }
        } else {
            labelRes.text = ""
        }
    }
    func rightButtonOctHex () {
        if textField.text?.count != 0 {
            if rightKey.isSelected == true {
                octDecCalc.inputOctString = textField.text!
                decHexCalc.inputDecString = octDecCalc.octDecConv()
                labelRes.text = decHexCalc.decHexFuncTotal()
            }
        } else {
            labelRes.text = ""
        }
    }
    func leftButtonDecOct () {
        if textField.text?.count != 0 {
            if leftKey.isSelected == true {
                decOctCalc.inputDecString = textField.text!
                labelRes.text = decOctCalc.decOctFuncTotal()
            }
        } else {
            labelRes.text = ""
        }
    }
    func rightButtonHexOct () {
        if textField.text?.count != 0 {
            if rightKey.isSelected == true {
                hexDecCalc.inputHexString = textField.text!
                decOctCalc.inputDecString = hexDecCalc.hexDecConv()
                labelRes.text = decOctCalc.decOctFuncTotal()
            }
        } else {
            labelRes.text = ""
        }
    }
    func leftButtonHexDec () {
        if textField.text?.count != 0 {
            if leftKey.isSelected == true {
                hexDecCalc.inputHexString = textField.text!
                labelRes.text = hexDecCalc.hexDecConv()
            }
        } else {
            labelRes.text = ""
        }
    }
    func rightButtonOctDec () {
        if textField.text?.count != 0 {
            if rightKey.isSelected == true {
                octDecCalc.inputOctString = textField.text!
                labelRes.text = octDecCalc.octDecConv()
            }
        } else {
            labelRes.text = ""
        }
    }
////
//// Снятие выделения у кнопок
    func selectOff() {
        labelRes.text = ""
        leftKey.isSelected = false
        rightKey.isSelected = false
    }
////
//// Выключение кейборда при ненажатых кнопках
    func keyboardOff() {
        if leftKey.isSelected == false && rightKey.isSelected == false {
            textField.isEnabled = false
        }
    }
//// Функция показа клавиш удаление бэкфордом!!!
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
////
//// Keyboards
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
    
////
//// Классы
    var decHexCalc = DecHexCalc()
    var hexDecCalc = HexDecCalc()
    var decOctCalc = DecOctCalc()
    var octDecCalc = OctDecCalc()
////
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitleTap()
        labelButton()
        keyboardOff()
        leftYoda.flash()
        rightYoda.flash()
        constraintTextField()
    }
//// Кнопка перехода в другую программу
    //        @IBAction func binatrixButton(_ sender: Any) {
    //            let appURL = NSURL(string: "binatrixHexastar://")!
    //            let webURL = NSURL(string: "https://itunes.apple.com/ru/app/binatrix/id1296545616")!
    //            let application = UIApplication.shared
    //
    //            if application.canOpenURL(appURL as URL) {
    //                application.open(appURL as URL)
    //            } else {
    //                application.open(webURL as URL)
    //            }
////           }
//// Тач в любую область чтоб убрать экран
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
////
    
}

