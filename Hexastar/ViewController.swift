//
//  ViewController.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 16.01.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit

class ViewController: UIViewController, KeyboardDelegate {
    @IBOutlet weak var textFieldHex: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//// KeyboardHEX
        let keyboardViewHex = KeyboardHex(frame: CGRect(x: 0, y: 0, width: 0, height: 246))
        keyboardViewHex.delegate = self
        textFieldHex.inputView = keyboardViewHex
    }
    func keyWasTapped(character: String) {
        if character == "delete" && (textFieldHex.text?.isEmpty)! == true {
            textFieldHex.text? = ""
        } else {
            if character == "delete" {
                textFieldHex.text?.removeLast()
            } else {
                textFieldHex.insertText(character)
            }
        }
    }
////
//// Button transition Binatrix
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
//// Touche screen off keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }
////
    
}

