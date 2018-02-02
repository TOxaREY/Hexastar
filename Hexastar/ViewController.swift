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
        flash.duration = 4
        flash.fromValue = 1
        flash.toValue = 0
        flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 1000000
        layer.add(flash, forKey: nil)
    }
}
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
//// Отключение вставить
class NMTextField: UITextField {
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
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
//// Ошибка
    func wrong() {
        pasteButton.isEnabled = true
        copyClearHiddenButton()
        labelRes.text?.removeAll()
        view.endEditing(true)
        let font = UIFont(name: "Menlo", size: 20.0)!
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor(red:0.55, green:0.55, blue:0.55, alpha:1.0), NSAttributedStringKey.font: font]
        textField.attributedText = NSAttributedString(string: NSLocalizedString("invalid value", comment: "invalid value") , attributes: attributes)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            self.textField.text?.removeAll()
        }
    }
////
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var leftKey: UIButton!
    @IBOutlet weak var rightKey: UIButton!
    @IBOutlet weak var labelRes: UILabel!
    @IBOutlet weak var leftYoda: UIImageView!
    @IBOutlet weak var rightYoda: UIImageView!
    @IBOutlet weak var copyButton: UIButton!
    @IBOutlet weak var pasteButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    @IBAction func clearButton(_ sender: Any) {
        textField.text?.removeAll()
        textField.isEnabled = false
        placeHoldersTitle()
        labelRes.text?.removeAll()
        leftKey.isSelected = false
        rightKey.isSelected = false
        redColorButton()
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
//// Вставка
    var pasteBoardString: String? = nil
    @IBAction func pasterButton(_ sender: Any) {
        pasteBoardString = UIPasteboard.general.string?.replacingOccurrences(of: ",", with: ".")
        if leftKey.isSelected != false || rightKey.isSelected != false {
        if pasteBoardString == nil {
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
////
//// Проверка вставки для разных направлений и вычисления
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
        case "hexadecimal"?: leftButtonDecHex()
        case "octal"?: leftButtonDecOct()
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
        case "octal"?: rightButtonHexOct()
        case "decimal"?: leftButtonHexDec()
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
        case "hexadecimal"?: rightButtonOctHex()
        case "decimal"?: rightButtonOctDec()
        default: break
        }
    }
    func pasteCheck() {
        switch labelTitle.text {
        case "hexadecimal"?: if leftKey.isSelected ==  true {
            pasteCheckDec()
        } else {
            pasteCheckOct()
            }
        case "octal"?: if leftKey.isSelected ==  true {
            pasteCheckDec()
        } else {
            pasteCheckHex()
            }
        case "decimal"?: if leftKey.isSelected ==  true {
            pasteCheckHex()
        } else {
            pasteCheckOct()
            }
        default:
            break
        }
        
    }
////
//// Две точки и первая точка
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
////
//// Положение поля ввода и рисунка
    func constraintTextField() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        switch screenHeight {
        case 736: textField.bottomAnchor.constraint(equalTo: textField.superview!.bottomAnchor, constant: -122).isActive = true
        case 812: textField.bottomAnchor.constraint(equalTo: textField.superview!.bottomAnchor, constant: -161).isActive = true
        case 667: textField.bottomAnchor.constraint(equalTo: textField.superview!.bottomAnchor, constant: -106).isActive = true
        case 568: textField.bottomAnchor.constraint(equalTo: textField.superview!.bottomAnchor, constant: -82).isActive = true
        default: break
        }
    }
    func constraintImage() {
        leftImage.translatesAutoresizingMaskIntoConstraints = false
        rightImage.translatesAutoresizingMaskIntoConstraints = false
        switch screenHeight {
        case 736: leftImage.bottomAnchor.constraint(equalTo: leftImage.superview!.bottomAnchor, constant: -122).isActive = true; rightImage.bottomAnchor.constraint(equalTo: rightImage.superview!.bottomAnchor, constant: -122).isActive = true
        case 812: leftImage.bottomAnchor.constraint(equalTo: leftImage.superview!.bottomAnchor, constant: -161).isActive = true; rightImage.bottomAnchor.constraint(equalTo: rightImage.superview!.bottomAnchor, constant: -161).isActive = true
        case 667: leftImage.bottomAnchor.constraint(equalTo: leftImage.superview!.bottomAnchor, constant: -106).isActive = true; rightImage.bottomAnchor.constraint(equalTo: rightImage.superview!.bottomAnchor, constant: -106).isActive = true
        case 568: leftImage.bottomAnchor.constraint(equalTo: leftImage.superview!.bottomAnchor, constant: -82).isActive = true; rightImage.bottomAnchor.constraint(equalTo: rightImage.superview!.bottomAnchor, constant: -82).isActive = true
        default: break
        }
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
        case 0: labelTitle.attributedText = NSAttributedString(string: NSLocalizedString("hexadecimal", comment: "hexadecimal") , attributes: attributes); tap += 1; placeHoldersTitle()
        case 1: labelTitle.attributedText = NSAttributedString(string: NSLocalizedString("octal", comment: "octal") , attributes: attributes); tap += 1; placeHoldersTitle()
        case 2: labelTitle.attributedText = NSAttributedString(string: NSLocalizedString("decimal", comment: "decimal") , attributes: attributes); tap = 0; placeHoldersTitle()
        default: break
        }
        textField.text = ""
        view.endEditing(true)
        selectOff()
        labelButton()
        redColorButton()
    }
////
//// Надпись на кнопке в зависисмоти от заголовка
    func labelButton() {
        leftKey.reversesTitleShadowWhenHighlighted = true
        rightKey.reversesTitleShadowWhenHighlighted = true
        switch labelTitle.text {
        case "hexadecimal"?: leftKey.setTitle("DEC", for: UIControlState.normal);
        rightKey.setTitle("OCT", for: UIControlState.normal)
        case "octal"?: leftKey.setTitle("DEC", for: UIControlState.normal); rightKey.setTitle("HEX", for: UIControlState.normal)
        case "decimal"?: leftKey.setTitle("HEX", for: UIControlState.normal); rightKey.setTitle("OCT", for: UIControlState.normal)
        default: break
        }
    }
////
//// Исходный красный на кнопках
    func redColorButton() {
        leftKey.setTitleColor(UIColor(red:0.89, green:0.01, blue:0.01, alpha:1.0), for: UIControlState.normal)
        rightKey.setTitleColor(UIColor(red:0.89, green:0.01, blue:0.01, alpha:1.0), for: UIControlState.normal)
    }
//// Нажатие кнопок
    @IBAction func leftPush(_ sender: UIButton) {
        textField.isEnabled = true
        rightKey.isSelected = false
        leftKey.isSelected = true
        leftKey.setTitleColor(UIColor(red:0.89, green:0.01, blue:0.01, alpha:1.0), for: UIControlState.normal)
        rightKey.setTitleColor(UIColor(red:0.06, green:0.32, blue:0.38, alpha:0.8), for: UIControlState.normal)
        textField.text = ""
        labelRes.text = ""
        copyClearHiddenButton()
        pasteButton.isHidden = false
        view.endEditing(true)
        switch labelTitle.text {
        case "hexadecimal"?: keyboardDec(); placeHoldersDec()
        case "octal"?: keyboardDec(); placeHoldersDec()
        case "decimal"?: keyboardHex(); placeHoldersHex()
        default:
            break
        }
    }
    @IBAction func rightPush(_ sender: UIButton) {
        textField.isEnabled = true
        leftKey.isSelected = false
        rightKey.isSelected = true
        rightKey.setTitleColor(UIColor(red:0.89, green:0.01, blue:0.01, alpha:1.0), for: UIControlState.normal)
        leftKey.setTitleColor(UIColor(red:0.06, green:0.32, blue:0.38, alpha:0.8), for: UIControlState.normal)
        textField.text = ""
        labelRes.text = ""
        copyClearHiddenButton()
        pasteButton.isHidden = false
        view.endEditing(true)
        switch labelTitle.text {
        case "hexadecimal"?: keyboardOct(); placeHoldersOct()
        case "octal"?: keyboardHex(); placeHoldersHex()
        case "decimal"?: keyboardOct(); placeHoldersOct()
        default:
            break
        }
    }
////
//// Плейсхолдеры
    func placeHoldersTitle() {
    let font = UIFont(name: "Menlo", size: 20.0)!
    let attributes = [NSAttributedStringKey.foregroundColor: UIColor(red:0.55, green:0.55, blue:0.55, alpha:1.0), NSAttributedStringKey.font: font]
    textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("выбери сторону конвертации", comment: "choose side of conversion"), attributes: attributes)
        copyClearHiddenButton()
        pasteButton.isHidden = true
        leftImage.isHidden = true
        rightImage.isHidden = true
    }
    func placeHoldersDec() {
        let font = UIFont(name: "Menlo", size: 20.0)!
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor(red:0.55, green:0.55, blue:0.55, alpha:1.0), NSAttributedStringKey.font: font]
        textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("введите 10-ное число", comment: "enter the decimal number"), attributes: attributes)
        imageDontHidden()
    }
    func placeHoldersOct() {
        let font = UIFont(name: "Menlo", size: 20.0)!
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor(red:0.55, green:0.55, blue:0.55, alpha:1.0), NSAttributedStringKey.font: font]
        textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("введите 8-ное число", comment: "enter the octal number"), attributes: attributes)
       imageDontHidden()
    }
    func placeHoldersHex() {
        let font = UIFont(name: "Menlo", size: 20.0)!
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor(red:0.55, green:0.55, blue:0.55, alpha:1.0), NSAttributedStringKey.font: font]
        textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("введите 16-ное число", comment: "enter the hexadecimal number"), attributes: attributes)
        imageDontHidden()
    }
////
//// Видимость картинок сбоку от textField
    func imageDontHidden() {
        leftImage.isHidden = false
        rightImage.isHidden = false
    }
////
//// Видимость кнопок стиреть и копировать
    func copyClearDontHiddenButton() {
        copyButton.isHidden = false
        clearButton.isHidden = false
    }
////
//// Видимость кнопок стиреть и копировать
    func copyClearHiddenButton() {
        copyButton.isHidden = true
        clearButton.isHidden = true
    }
////
//// Поле ввода и вычисления
    @IBAction func inputTextField(_ sender: Any) {
        textField.placeholder?.removeAll()
        dotta()
        if textField.text!.count > 13 {
            textField.deleteBackward()
        }
        switch labelTitle.text {
        case "hexadecimal"?: leftButtonDecHex(); rightButtonOctHex()
        case "octal"?: leftButtonDecOct(); rightButtonHexOct()
        case "decimal"?: leftButtonHexDec(); rightButtonOctDec()
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
//// Пользовательский бордюр textField
    func borderTextField() {
        let borderColor : UIColor = UIColor(red:0.55, green:0.55, blue:0.55, alpha:1.0)
        textField.layer.borderWidth = 2
        textField.layer.borderColor = borderColor.cgColor
        textField.layer.cornerRadius = 5.0

    }
////
//// Классы вычислений
    var decHexCalc = DecHexCalc()
    var hexDecCalc = HexDecCalc()
    var decOctCalc = DecOctCalc()
    var octDecCalc = OctDecCalc()
////


    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintTextField()
        constraintImage()
        leftYoda.flash()
        rightYoda.flash()
        labelTitleTap()
        labelButton()
        keyboardOff()
        placeHoldersTitle()
        UITextField.appearance().tintColor = UIColor(red:1.00, green:0.91, blue:0.12, alpha:1.0)
        borderTextField()

        
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

