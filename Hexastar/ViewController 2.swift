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
    @IBOutlet weak var textField: UITextField!
    @IBAction func characterInput(_ sender: Any) {
        characterUnicode.inputCharacter = textField.text!
        resultLabel.text = characterUnicode.simbolUnicodeConvert()    }
    @IBOutlet weak var resultLabel: UILabel!


//// Положение поля результата
    func constraintResultLabel() {
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        switch screenHeight {
        case 736: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -310).isActive = true
        case 812: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -343).isActive = true
        case 667: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -301).isActive = true
        case 568: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -301).isActive = true
        default: resultLabel.bottomAnchor.constraint(equalTo: resultLabel.superview!.bottomAnchor, constant: -345).isActive = true
        }
    }
////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintResultLabel()

        
   }
    
    
    
//// Тач в любую область чтоб убрать экран
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
////
}
