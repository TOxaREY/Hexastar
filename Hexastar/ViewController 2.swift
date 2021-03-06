//
//  ViewController 2.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 12.02.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit
import Foundation

// Start label one view
public var vc2ViewCount = 0


class ViewController2: UIViewController {
    // Change color status bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // Class calculating
    var characterUnicode = CharacterUnicodeConverter()
    
    @IBOutlet weak var startLabel: UILabel!
    // Paste
    @IBOutlet weak var buttonPaste: UIButton!
    func wrong() {
        let font = UIFont(name: "Xolonium", size: 13.0)!
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.55, green:0.55, blue:0.55, alpha:1.0), NSAttributedString.Key.font: font]
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
    
    @IBOutlet weak var segueButton2: UIButton!
    @IBOutlet weak var segueLabel2: UILabel!
    @IBOutlet weak var buttonReset: UIButton!
    @IBAction func buttonToVC(_ sender: Any) {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let sB: UIStoryboard = UIStoryboard(name: nameStoryboard, bundle: nil)
        let newVC = sB.instantiateViewController(withIdentifier: "VC")
        appDel.window?.rootViewController = newVC
        appDel.window?.makeKeyAndVisible()
    }
    @IBAction func buttonToVC3(_ sender: Any) {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let sB: UIStoryboard = UIStoryboard(name: nameStoryboard, bundle: nil)
        let newVC = sB.instantiateViewController(withIdentifier: "VC3")
        appDel.window?.rootViewController = newVC
        appDel.window?.makeKeyAndVisible()
    }
    // Reset
    @IBAction func buttonReset(_ sender: Any) {
        startLabel.isHidden = true
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "jump"), object: nil)
        textField.text?.removeAll()
        placeHolder()
        resultLabel.text?.removeAll()
        view.endEditing(true)
    }
    
    @IBOutlet weak var textField: UITextField!
    // Touch to field hiden startLabel
    @IBAction func touchTextField(_ sender: UITextField) {
        startLabel.isHidden = true
    }
    
    // Calculating font and multicolor string
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
            case 896: font = UIFont(name: "STARWARS", size: 38.0)!
            case 812: font = UIFont(name: "STARWARS", size: 36.0)!
            case 736: font = UIFont(name: "STARWARS", size: 35.0)!
            case 667: font = UIFont(name: "STARWARS", size: 29.0)!
            case 568: font = UIFont(name: "STARWARS", size: 22.0)!
            case 480: font = UIFont(name: "STARWARS", size: 18.0)!
            default: font = UIFont(name: "STARWARS", size: 35.0)!
            }
            let attributesYellow = [NSAttributedString.Key.foregroundColor: UIColor(red:1.00, green:0.91, blue:0.12, alpha:1.0), NSAttributedString.Key.font: font, NSAttributedString.Key.strokeWidth: -2, NSAttributedString.Key.strokeColor:UIColor.black] as [NSAttributedString.Key : Any]
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
                myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red:0.89, green:0.01, blue:0.01, alpha:1.0), range: NSRange(location:firstCount,length:secondCount - firstCount))
                resultLabel.attributedText = myMutableString
            } else {
                resultLabel.attributedText = NSAttributedString(string: characterUnicode.simbolUnicodeConvert(), attributes: attributesYellow)
            }
        } else {
            textField.text?.removeLast()
            calculating()
        }
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    // Position resultLabel
    func constraintResultLabel() {
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        switch screenHeight {
        case 736: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -94).isActive = true
        case 812: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -143).isActive = true
        case 896: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -143).isActive = true
        case 667: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -102).isActive = true
        case 568: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -128).isActive = true
        case 480: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -128).isActive = true
        default: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -94).isActive = true
        }
    }
    
    // Placeholders
    func placeHolder() {
        let font = UIFont(name: "Xolonium", size: 13.0)!
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.55, green:0.55, blue:0.55, alpha:1.0), NSAttributedString.Key.font: font]
        textField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("enter up to 3 characters", comment: "enter up to 3 characters"), attributes: attributes)
    }
    
    // Customer border textField
    func borderTextField() {
        let borderColor : UIColor = UIColor(red:0.55, green:0.55, blue:0.55, alpha:1.0)
        textField.layer.borderWidth = 2
        textField.layer.borderColor = borderColor.cgColor
        textField.layer.cornerRadius = 5.0
        
    }
    
    deinit {
        print("VC2")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Start label one view
        if vc2ViewCount > 0 {
            startLabel.isHidden = true
        } else {
            vc2ViewCount = 1
        }
        borderTextField()
        placeHolder()
        let font = UIFont(name: "Xolonium", size: 18.0)!
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor(red:1.00, green:0.91, blue:0.12, alpha:1.0), NSAttributedString.Key.font: font]
        let font1 = UIFont(name: "Xolonium", size: 13.0)!
        let attributes1 = [NSAttributedString.Key.foregroundColor: UIColor(red:1.00, green:0.91, blue:0.12, alpha:1.0), NSAttributedString.Key.font: font1]
        startLabel.shadowColor = UIColor .black
        startLabel.shadowOffset = CGSize(width: 2, height: 1)
        startLabel.attributedText = NSAttributedString(string: NSLocalizedString("It's time to choose a side conversion! At the top select the format of the result by touching, then enter data below", comment: "startLabelVC2") , attributes: attributes)
        segueLabel2.shadowColor = UIColor .black
        segueLabel2.shadowOffset = CGSize(width: 2, height: 1)
        segueLabel2.attributedText = NSAttributedString(string: NSLocalizedString("converter DEC<->HEX<->OCT<->DEC", comment: "DEC<->HEX<->OCT<->DEC") , attributes: attributes1)
        UITextField.appearance().tintColor = UIColor(red:0.16, green:0.65, blue:0.91, alpha:1.0)
        constraintResultLabel()
        
    }
    // Touch to any area to remove the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil {
            startLabel.isHidden = true
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
}
