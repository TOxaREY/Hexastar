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

    @IBOutlet weak var textField: UITextField!
    @IBAction func characterInput(_ sender: Any) {
        characterUnicode.inputCharacter = textField.text!
        resultLabel.text = characterUnicode.simbolUnicodeConvert()    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    
   var characterUnicode = CharacterUnicodeConverter()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
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
