//
//  ViewController 2.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 12.02.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit
import Foundation

class ViewController2: UIViewController {
//// Смена цвета текста статус бара
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
////
//// Блокировка поворота
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    override var shouldAutorotate: Bool {
        return false
    }
////
//// Вызов вычислений
 var characterUnicode = CharacterUnicodeConverter()
////
    @IBOutlet weak var startLabel: UILabel!
//// Вставить
    @IBOutlet weak var buttonPaste: UIButton!
    func wrong() {
        let font = UIFont(name: "Neuropol", size: 13.0)!
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor(red:0.55, green:0.55, blue:0.55, alpha:1.0), NSAttributedStringKey.font: font]
        textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("invalid value", comment: "invalid value") , attributes: attributes)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            self.textField.text?.removeAll()
            self.placeHolder()
      }
   }
    var pasteBoardString: String? = nil
    @IBAction func buttonPaste(_ sender: Any) {
        startLabel.isHidden = true
        textField.placeholder?.removeAll()
        pasteBoardString = UIPasteboard.general.string
            if pasteBoardString == nil || pasteBoardString == "" {
                wrong()
            } else {
                    if pasteBoardString!.count > 3 {
                        let overCount = pasteBoardString!.count - 3
                        pasteBoardString = String(pasteBoardString!.dropLast(overCount))
                    }
                    if ((pasteBoardString)!).count <= 3 {
                        switch pasteBoardString?.count {
                        case 0?: textField.text = pasteBoardString;calculating()
                        case 1?: textField.text = pasteBoardString;calculating()
                        case 2?: textField.text = String(describing: pasteBoardString![(pasteBoardString!.startIndex)]);calculating();textField.text = pasteBoardString;calculating()
                        case 3?: textField.text = String(describing: pasteBoardString! [(pasteBoardString!.startIndex)]);calculating();textField.text = String(describing: pasteBoardString! [(pasteBoardString!.startIndex)]) + String(describing: pasteBoardString![pasteBoardString!.index(after: (pasteBoardString!.startIndex))]);calculating();textField.text = pasteBoardString;calculating()
                        default: break
                        }
                  }
           }
    }
////
    @IBOutlet weak var segueButton2: UIButton!
    @IBOutlet weak var segueLabel2: UILabel!
    @IBOutlet weak var buttonReset: UIButton!
//// Сброс
    @IBAction func buttonReset(_ sender: Any) {
        startLabel.isHidden = true
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "jump"), object: nil)
        textField.text?.removeAll()
        placeHolder()
        resultLabel.text?.removeAll()
        view.endEditing(true)
    }
////
    @IBOutlet weak var textField: UITextField!
//// Вычисления шрифт и мультиколор стринг
    var firstCount = Int()
    var secondCount = Int()
    @IBAction func characterInput(_ sender: Any) {
        startLabel.isHidden = true
        calculating()
    }
    func calculating() {
        if ((textField.text)!).count <= 3  {
            characterUnicode.inputCharacter = textField.text!
            var font = UIFont(name: "STARWARS", size: 22.0)!
            switch screenHeight {
            case 812: font = UIFont(name: "STARWARS", size: 38.0)!
            case 736: font = UIFont(name: "STARWARS", size: 38.0)!
            case 667: font = UIFont(name: "STARWARS", size: 32.0)!
            case 568: font = UIFont(name: "STARWARS", size: 22.0)!
            default: font = UIFont(name: "STARWARS", size: 22.0)!
            }
            let attributesYellow = [NSAttributedStringKey.foregroundColor: UIColor(red:1.00, green:0.91, blue:0.12, alpha:1.0), NSAttributedStringKey.font: font, NSAttributedStringKey.strokeWidth: -2, NSAttributedStringKey.strokeColor:UIColor.black] as [NSAttributedStringKey : Any]
            switch textField.text?.count {
            case 0?: firstCount = 0
            case 1?: firstCount = characterUnicode.simbolUnicodeConvert().count; secondCount = 0
            case 2?: secondCount = characterUnicode.simbolUnicodeConvert().count
            case 3?: characterUnicode.inputCharacter = String(textField.text!.dropLast()); secondCount = characterUnicode.simbolUnicodeConvert().count; characterUnicode.inputCharacter = String(textField.text!.dropLast(2));firstCount = characterUnicode.simbolUnicodeConvert().count
            default: break
            }
            if secondCount > firstCount {
                characterUnicode.inputCharacter = textField.text!
                var myMutableString = NSMutableAttributedString()
                myMutableString = NSMutableAttributedString(string: characterUnicode.simbolUnicodeConvert(), attributes: attributesYellow)
                myMutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(red:0.89, green:0.01, blue:0.01, alpha:1.0), range: NSRange(location:firstCount,length:secondCount - firstCount))
                resultLabel.attributedText = myMutableString
            } else {
                resultLabel.attributedText = NSAttributedString(string: characterUnicode.simbolUnicodeConvert(), attributes: attributesYellow)
            }
        } else {
            textField.text?.removeLast()
            calculating()
        }
    }
////
    @IBOutlet weak var resultLabel: UILabel!

    
//// Положение поля результата
    func constraintResultLabel() {
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        switch screenHeight {
        case 736: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -94).isActive = true
        case 812: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -143).isActive = true
        case 667: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -102).isActive = true
        case 568: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -128).isActive = true
        default: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -143).isActive = true
        }
    }
////
//// Плейсхолдер
    func placeHolder() {
        let font = UIFont(name: "Neuropol", size: 13.0)!
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor(red:0.55, green:0.55, blue:0.55, alpha:1.0), NSAttributedStringKey.font: font]
        textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("enter up to 3 characters", comment: "enter up to 3 characters"), attributes: attributes)
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
    override func viewDidLoad() {
        super.viewDidLoad()
        borderTextField()
        placeHolder()
        let font = UIFont(name: "Neuropol", size: 20.0)!
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor(red:1.00, green:0.91, blue:0.12, alpha:1.0), NSAttributedStringKey.font: font]
        let font1 = UIFont(name: "Neuropol", size: 14.0)!
        let attributes1 = [NSAttributedStringKey.foregroundColor: UIColor(red:1.00, green:0.91, blue:0.12, alpha:1.0), NSAttributedStringKey.font: font1]
        startLabel.shadowColor = UIColor .black
        startLabel.shadowOffset = CGSize(width: 1, height: 1)
        startLabel.attributedText = NSAttributedString(string: NSLocalizedString("It's Time To Choose A Side Convertion! At the top, select the format of the result by touching, then select the input format below", comment: "startLabel") , attributes: attributes)
        segueLabel2.shadowColor = UIColor .black
        segueLabel2.shadowOffset = CGSize(width: 1, height: 1)
        segueLabel2.attributedText = NSAttributedString(string: NSLocalizedString("converter DEC<->HEX<->OCT<->DEC", comment: "DEC<->HEX<->OCT<->DEC") , attributes: attributes1)
        UITextField.appearance().tintColor = UIColor(red:0.16, green:0.65, blue:0.91, alpha:1.0)
        constraintResultLabel()
    }
    //// Тач в любую область чтоб убрать экран
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
}
