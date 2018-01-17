//
//  ViewController.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 16.01.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit

class ViewController: UIViewController, KeyboardDelegate {
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let keyboardView = Keyboard(frame: CGRect(x: 0, y: 0, width: 0, height: 246))
        keyboardView.delegate = self
        textField.inputView = keyboardView
    }
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
    
    // кнопка перехода на Binatrix
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
    //    }
    
    
}

