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
 var characterUnicode = CharacterUnicodeConverter()
 var firstCount = Int()
 var secondCount = Int()
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var buttonPaste: UIButton!
    func wrong() {
        print("wrong")
    }
    var pasteBoardString: String? = nil
    @IBAction func buttonPaste(_ sender: Any) {
        textField.placeholder?.removeAll()
        pasteBoardString = UIPasteboard.general.string
            if pasteBoardString == nil {
                wrong()
            } else {
                    if pasteBoardString!.count > 3 {
                        let overCount = pasteBoardString!.count - 3
                        pasteBoardString = String(pasteBoardString!.dropLast(overCount))
                    }
                    if ((pasteBoardString)!).count <= 3 {
                        textField.text = pasteBoardString
                        calculating()
                    }
                }
        print(pasteBoardString)
            }
    @IBOutlet weak var buttonReset: UIButton!
    @IBAction func buttonReset(_ sender: Any) {
        textField.text?.removeAll()
        resultLabel.text?.removeAll()
        view.endEditing(true)
    }
    @IBOutlet weak var textField: UITextField!
    @IBAction func characterInput(_ sender: Any) {
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
            let attributesYellow = [NSAttributedStringKey.foregroundColor: UIColor(red:1.00, green:0.91, blue:0.12, alpha:1.0), NSAttributedStringKey.font: font] as [NSAttributedStringKey : Any]
            switch textField.text?.count {
            case 0?: firstCount = 0
            case 1?: firstCount = characterUnicode.simbolUnicodeConvert().count; secondCount = 0
            case 2?: secondCount = characterUnicode.simbolUnicodeConvert().count
            default: break
            }
            if secondCount > firstCount {
                var myMutableString = NSMutableAttributedString()
                myMutableString = NSMutableAttributedString(string: characterUnicode.simbolUnicodeConvert(), attributes: attributesYellow)
                myMutableString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor(red:0.89, green:0.01, blue:0.01, alpha:1.0), range: NSRange(location:firstCount,length:secondCount - firstCount))
                resultLabel.attributedText = myMutableString
            } else {
                resultLabel.attributedText = NSAttributedString(string: characterUnicode.simbolUnicodeConvert(), attributes: attributesYellow)
            }
        } else {
            textField.text?.removeLast()
        }
    }
    @IBOutlet weak var resultLabel: UILabel!
//// Положение поля результата
    func constraintResultLabel() {
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        switch screenHeight {
        case 736: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -318).isActive = true
        case 812: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -346).isActive = true
        case 667: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -305).isActive = true
        case 568: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -301).isActive = true
        default: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -345).isActive = true
        }
    }
////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonPaste.isHidden = true
        buttonReset.isHidden = true
        textField.isHidden = true
        let font = UIFont(name: "Neuropol", size: 20.0)!
        let attributes = [NSAttributedStringKey.foregroundColor: UIColor(red:1.00, green:0.91, blue:0.12, alpha:1.0), NSAttributedStringKey.font: font]
        startLabel.attributedText = NSAttributedString(string: NSLocalizedString("It's Time To Choose A Side Convertion! At the top, select the format of the result by touching, then select the input format below", comment: "startLabel") , attributes: attributes)
        UITextField.appearance().tintColor = UIColor(red:0.16, green:0.65, blue:0.91, alpha:1.0)
        constraintResultLabel()
}
    
    
    
    
//// Тач в любую область чтоб убрать экран
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil {
            view.endEditing(true)
            startLabel.isHidden = true
            buttonPaste.isHidden = false
            buttonReset.isHidden = false
            textField.isHidden = false
        }
        super.touchesBegan(touches, with: event)
    }
////
}
