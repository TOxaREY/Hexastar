//
//  ViewController 3.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 12.02.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit
import Foundation

class ViewController3: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
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
//// Вызов вычисления
    var uniChar = UnicodeCharacterConverter()
////
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var addButton1: UIButton!
    @IBOutlet weak var addButton2: UIButton!
    @IBOutlet weak var addButton3: UIButton!
    @IBOutlet weak var addButton4: UIButton!
    @IBOutlet weak var addButton5: UIButton!
    @IBOutlet weak var addButton6: UIButton!
    @IBOutlet weak var addButton7: UIButton!
    @IBOutlet weak var clear1: UIButton!
    @IBOutlet weak var clear2: UIButton!
    @IBOutlet weak var clear3: UIButton!
    @IBOutlet weak var clear4: UIButton!
    @IBOutlet weak var clear5: UIButton!
    @IBOutlet weak var clear6: UIButton!
    @IBOutlet weak var clear7: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    
    @IBAction func addButton1(_ sender: Any) {
        if picker1.isHidden == true {
            self.picker1.delegate = self
            self.picker1.delegate = self
            picker1.isHidden = false
            label1.isHidden = false
            addButton1.setImage(#imageLiteral(resourceName: "remove"), for: UIControlState.normal)
            clear1.isHidden = false
        } else {
            picker1.isHidden = true
            clear1.isHidden = true
            label1.isHidden = true
            addButton1.setImage(#imageLiteral(resourceName: "add"), for: UIControlState.normal)
            resetPicker1()
        }
    }
    @IBAction func addButton2(_ sender: Any) {
        if picker2.isHidden == true {
            self.picker2.delegate = self
            self.picker2.delegate = self
            picker2.isHidden = false
            label2.isHidden = false
            addButton2.setImage(#imageLiteral(resourceName: "remove"), for: UIControlState.normal)
            clear2.isHidden = false
        } else {
            picker2.isHidden = true
            clear2.isHidden = true
            label2.isHidden = true
            addButton2.setImage(#imageLiteral(resourceName: "add"), for: UIControlState.normal)
            resetPicker2()
        }
    }
    @IBAction func addButton3(_ sender: Any) {
        if picker3.isHidden == true {
            self.picker3.delegate = self
            self.picker3.delegate = self
            picker3.isHidden = false
            label3.isHidden = false
            addButton3.setImage(#imageLiteral(resourceName: "remove"), for: UIControlState.normal)
            clear3.isHidden = false
        } else {
            picker3.isHidden = true
            clear3.isHidden = true
            label3.isHidden = true
            addButton3.setImage(#imageLiteral(resourceName: "add"), for: UIControlState.normal)
            resetPicker3()
        }
    }
    @IBAction func addButton4(_ sender: Any) {
        if picker4.isHidden == true {
            self.picker4.delegate = self
            self.picker4.delegate = self
            picker4.isHidden = false
            label4.isHidden = false
            addButton4.setImage(#imageLiteral(resourceName: "remove"), for: UIControlState.normal)
            clear4.isHidden = false
        } else {
            picker4.isHidden = true
            clear4.isHidden = true
            addButton4.setImage(#imageLiteral(resourceName: "add"), for: UIControlState.normal)
            label4.isHidden = true
            resetPicker4()
        }
    }
    @IBAction func addButton5(_ sender: Any) {
        if picker5.isHidden == true {
            self.picker5.delegate = self
            self.picker5.delegate = self
            picker5.isHidden = false
            label5.isHidden = false
            addButton5.setImage(#imageLiteral(resourceName: "remove"), for: UIControlState.normal)
            clear5.isHidden = false
        } else {
            picker5.isHidden = true
            label5.isHidden = true
            addButton5.setImage(#imageLiteral(resourceName: "add"), for: UIControlState.normal)
            clear5.isHidden = true
            resetPicker5()
        }
    }
    @IBAction func addButton6(_ sender: Any) {
        if picker6.isHidden == true {
            self.picker6.delegate = self
            self.picker6.delegate = self
            picker6.isHidden = false
            label6.isHidden = false
            addButton6.setImage(#imageLiteral(resourceName: "remove"), for: UIControlState.normal)
            clear6.isHidden = false
        } else {
            picker6.isHidden = true
            label6.isHidden = true
            addButton6.setImage(#imageLiteral(resourceName: "add"), for: UIControlState.normal)
            clear6.isHidden = true
            resetPicker6()
        }
    }
    @IBAction func addButton7(_ sender: Any) {
        if picker7.isHidden == true {
            self.picker7.delegate = self
            self.picker7.delegate = self
            picker7.isHidden = false
            label7.isHidden = false
            addButton7.setImage(#imageLiteral(resourceName: "remove"), for: UIControlState.normal)
            clear7.isHidden = false
        } else {
            picker7.isHidden = true
            label7.isHidden = true
            addButton7.setImage(#imageLiteral(resourceName: "add"), for: UIControlState.normal)
            clear7.isHidden = true
            resetPicker7()
        }
    }
    
//// Сброс пикервью
    func resetPicker1() {
        for index in 0...4 {
            picker1.selectRow(0, inComponent: index, animated: true)
        }
        res1 = ""
        resultLabel.text! = res2 + res3 + res4 + res5 + res6 + res7
    }
    func resetPicker2() {
        for index in 0...4 {
            picker2.selectRow(0, inComponent: index, animated: true)
        }
           res2 = ""
           resultLabel.text! = res1 + res3 + res4 + res5 + res6 + res7
    }
    func resetPicker3() {
        for index in 0...4 {
            picker3.selectRow(0, inComponent: index, animated: true)
        }
        res3 = ""
        resultLabel.text! = res1 + res2 + res4 + res5 + res6 + res7
    }
    func resetPicker4() {
        for index in 0...4 {
            picker4.selectRow(0, inComponent: index, animated: true)
        }
        res4 = ""
        resultLabel.text! = res1 + res2 + res3 + res5 + res6 + res7
    }
    func resetPicker5() {
        for index in 0...4 {
            picker5.selectRow(0, inComponent: index, animated: true)
        }
        res5 = ""
        resultLabel.text! = res1 + res2 + res3 + res4 + res6 + res7
    }
    func resetPicker6() {
        for index in 0...4 {
            picker6.selectRow(0, inComponent: index, animated: true)
        }
        res6 = ""
        resultLabel.text! = res1 + res2 + res3 + res4 + res5 + res7
    }
    func resetPicker7() {
        for index in 0...4 {
            picker7.selectRow(0, inComponent: index, animated: true)
        }
        res7 = ""
        resultLabel.text! = res1 + res2 + res3 + res4 + res5 + res6
    }
    @IBAction func clear1(_ sender: Any) {
              resetPicker1()
    }
    @IBAction func clear2(_ sender: Any) {
              resetPicker2()
    }
    @IBAction func clear3(_ sender: Any) {
        resetPicker3()
    }
    @IBAction func clear4(_ sender: Any) {
        resetPicker4()
    }
    @IBAction func clear5(_ sender: Any) {
        resetPicker5()
    }
    @IBAction func clear6(_ sender: Any) {
        resetPicker6()
    }
    @IBAction func clear7(_ sender: Any) {
        resetPicker7()
    }
////

//// Pickers
    @IBOutlet weak var picker1: UIPickerView!
    @IBOutlet weak var picker2: UIPickerView!
    @IBOutlet weak var picker3: UIPickerView!
    @IBOutlet weak var picker4: UIPickerView!
    @IBOutlet weak var picker5: UIPickerView!
    @IBOutlet weak var picker6: UIPickerView!
    @IBOutlet weak var picker7: UIPickerView!
    
    var pickerData: [[String]] = [[String]]()
    let hexadecimal = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"]
    func pikers() {
        label1.isHidden = true
        label2.isHidden = true
        label3.isHidden = true
        label4.isHidden = true
        label5.isHidden = true
        label6.isHidden = true
        label7.isHidden = true
        picker1.isHidden = true
        clear1.isHidden = true
        picker2.isHidden = true
        clear2.isHidden = true
        picker3.isHidden = true
        clear3.isHidden = true
        picker4.isHidden = true
        clear4.isHidden = true
        picker5.isHidden = true
        clear5.isHidden = true
        picker6.isHidden = true
        clear6.isHidden = true
        picker7.isHidden = true
        clear7.isHidden = true
        pickerData = [[String]](repeatElement(hexadecimal, count: 5))
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 16
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "STARWARS", size: 30.0)!
            pickerLabel?.textAlignment = .center
        }
        pickerView.backgroundColor = UIColor.clear
        pickerLabel?.text = pickerData[component][row]
        pickerLabel?.textColor = UIColor(red:1.00, green:0.91, blue:0.12, alpha:1.0)
        
        return pickerLabel!
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
      }
    var comp1:String = "U+00000"
    var comp2:String = "U+00000"
    var comp3:String = "U+00000"
    var comp4:String = "U+00000"
    var comp5:String = "U+00000"
    var comp6:String = "U+00000"
    var comp7:String = "U+00000"
    var res1 = String ()
    var res2 = String ()
    var res3 = String ()
    var res4 = String ()
    var res5 = String ()
    var res6 = String ()
    var res7 = String ()

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        func compSum() -> String {
            var arrayCompSum = [String]()
            for i in 0...4 {
                arrayCompSum.append(pickerData[i][pickerView.selectedRow(inComponent: i)])
            }
            return String(arrayCompSum.reduce("", +))
        }
        switch pickerView {
        case picker1: comp1 = "U+\(compSum())";uniChar.inputUnicode = comp1;res1 = uniChar.unicodeSimbolConvert()
        case picker2: comp2 = "U+\(compSum())";uniChar.inputUnicode = comp2;res2 = uniChar.unicodeSimbolConvert()
        case picker3: comp3 = "U+\(compSum())";uniChar.inputUnicode = comp3;res3 = uniChar.unicodeSimbolConvert()
        case picker4: comp4 = "U+\(compSum())";uniChar.inputUnicode = comp4;res4 = uniChar.unicodeSimbolConvert()
        case picker5: comp5 = "U+\(compSum())";uniChar.inputUnicode = comp5;res5 = uniChar.unicodeSimbolConvert()
        case picker6: comp6 = "U+\(compSum())";uniChar.inputUnicode = comp6;res6 = uniChar.unicodeSimbolConvert()
        case picker7: comp7 = "U+\(compSum())";uniChar.inputUnicode = comp7;res7 = uniChar.unicodeSimbolConvert()
        default: break
        }

        resultLabel.text! = res1 + res2 + res3 + res4 + res5 + res6 + res7
    }
////
//// Положение нижнего вьювера и кнопок
    func constraintView() {
        view3.translatesAutoresizingMaskIntoConstraints = false
        switch screenHeight {
        case 736: view3.heightAnchor.constraint(equalToConstant: 147).isActive = true
        case 812: view3.heightAnchor.constraint(equalToConstant: 164).isActive = true
        case 667: view3.heightAnchor.constraint(equalToConstant: 132).isActive = true
        case 568: view3.heightAnchor.constraint(equalToConstant: 110).isActive = true
        default: view3.heightAnchor.constraint(equalToConstant: 110).isActive = true
        }
    }
////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pikers()
        constraintView()
    }

}

