//
//  ViewController.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 16.01.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit

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
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var leftKey: UIButton!
    @IBOutlet weak var rightKey: UIButton!
    @IBOutlet weak var labelRes: UILabel!
//// Нажатие меняет заголовок
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        labelTitleTap()
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
//// Нажатие кнопок
    @IBAction func leftPush(_ sender: UIButton) {
        rightKey.isSelected = false
        leftKey.isSelected = true
        textField.text = ""
        view.endEditing(true)
        switch labelTitle.text {
        case "hexadecimal"?: leftButtonDecHex()
        case "octal"?: leftButtonDecOct()
        case "decimal"?: leftButtonHexDec()
        default:
            break
        }
    }
    @IBAction func rightPush(_ sender: UIButton) {
        leftKey.isSelected = false
        rightKey.isSelected = true
        textField.text = ""
        view.endEditing(true)
        switch labelTitle.text {
        case "hexadecimal"?: rightButtonOctHex()
        case "octal"?: rightButtonHexOct()
        case "decimal"?: rightButtonOctDec()
        default:
            break
        }
    }
////
//// Поле ввода зависимость от заголовка выдает направление конвертирования
    
    @IBAction func inputTextField(_ sender: UITextField) {
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
                labelRes.text = "Dec to Hex"
            }
        } else {
            labelRes.text = ""
        }
    }
    func rightButtonOctHex () {
        if textField.text?.count != 0 {
            if rightKey.isSelected == true {
                labelRes.text = "Oct to Hex"
            }
        } else {
            labelRes.text = ""
        }
    }
    func leftButtonDecOct () {
        if textField.text?.count != 0 {
            if leftKey.isSelected == true {
                labelRes.text = "Dec to Oct"
            }
        } else {
            labelRes.text = ""
        }
    }
    func rightButtonHexOct () {
        if textField.text?.count != 0 {
            if rightKey.isSelected == true {
                labelRes.text = "Hex to Oct"
            }
        } else {
            labelRes.text = ""
        }
    }
    func leftButtonHexDec () {
        if textField.text?.count != 0 {
            if leftKey.isSelected == true {
                labelRes.text = "Hex to Dec"
            }
        } else {
            labelRes.text = ""
        }
    }
    func rightButtonOctDec () {
        if textField.text?.count != 0 {
            if rightKey.isSelected == true {
                labelRes.text = "Oct to Dec"
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
//// Функция показа клавиш
    func keyWasTapped(character: String) {
        if character == "delete" && (textField.text?.isEmpty)! == true {
            textField.text? = ""
        } else {
            if character == "delete" {
                textField.text?.removeLast()
            } else {
                textField.insertText(character)
            }
        }
    }
////
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitleTap()
        labelButton()
       
//// KeyboardHEX внутри viewLoad
        let keyboardViewHex = KeyboardHex(frame: CGRect(x: 0, y: 0, width: 0, height: Int(heightKeyboard())))
        keyboardViewHex.delegate = self
        textField.inputView = keyboardViewHex
        
////
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

