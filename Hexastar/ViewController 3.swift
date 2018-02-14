//
//  ViewController 3.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 12.02.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit
import Foundation

class ViewController3: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    
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
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var clear1: UIButton!
    @IBOutlet weak var clear2: UIButton!
    @IBAction func addButton(_ sender: Any) {
        if picker2.isHidden == true {
       picker2.isHidden = false
            clear2.isHidden = false
        } else {
            picker2.isHidden = true
            clear2.isHidden = true
            resetPicker2()
        }
    }
//// Сброс пикервью
    func resetPicker1() {
        for index in 0...4 {
            picker1.selectRow(0, inComponent: index, animated: true)
        }
        comp1 = "U+00000"
        uniChar.inputUnicode = [comp1, comp2]
        resultLabel.text = uniChar.unicodeSimbolConvert()
    }
    func resetPicker2() {
        for index in 0...4 {
            picker2.selectRow(0, inComponent: index, animated: true)
        }
        comp2 = "U+00000"
        uniChar.inputUnicode = [comp1, comp2]
        resultLabel.text = uniChar.unicodeSimbolConvert()
    }
    @IBAction func clear1(_ sender: Any) {
              resetPicker1()
    }
    @IBAction func clear2(_ sender: Any) {
              resetPicker2()
    }
////
    
    
    
    
    
    
    

//// Pickers
    @IBOutlet weak var picker2: UIPickerView!
    @IBOutlet weak var picker1: UIPickerView!
    var pickerData1: [[String]] = [[String]]()
    var pickerData2: [[String]] = [[String]]()
    let hexadecimal = ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"]
    func pikers() {
        self.picker1.delegate = self
        self.picker2.delegate = self
        self.picker1.dataSource = self
        self.picker2.dataSource = self
        picker2.isHidden = true
        clear2.isHidden = true
        pickerData1 = [[String]](repeatElement(hexadecimal, count: 5))
        pickerData2 = [[String]](repeatElement(hexadecimal, count: 5))
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 16
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == picker1 {
        return pickerData1[component][row]
        } else {
        return pickerData2[component][row]
        }
      }
    var comp1:String = "U+00000"
    var comp2:String = "U+00000"
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == picker1 {
        let comp10 = pickerData1[0][pickerView.selectedRow(inComponent: 0)]
        let comp11 = pickerData1[1][pickerView.selectedRow(inComponent: 1)]
        let comp12 = pickerData1[2][pickerView.selectedRow(inComponent: 2)]
        let comp13 = pickerData1[3][pickerView.selectedRow(inComponent: 3)]
        let comp14 = pickerData1[4][pickerView.selectedRow(inComponent: 4)]
             comp1 = "U+\(comp10 + comp11 + comp12 + comp13 + comp14)"
        } else if pickerView == picker2 {
        let comp20 = pickerData2[0][pickerView.selectedRow(inComponent: 0)]
        let comp21 = pickerData2[1][pickerView.selectedRow(inComponent: 1)]
        let comp22 = pickerData2[2][pickerView.selectedRow(inComponent: 2)]
        let comp23 = pickerData2[3][pickerView.selectedRow(inComponent: 3)]
        let comp24 = pickerData2[4][pickerView.selectedRow(inComponent: 4)]
             comp2 = "U+\(comp20 + comp21 + comp22 + comp23 + comp24)"
    }
        uniChar.inputUnicode = [comp2, comp1]
        resultLabel.text! = uniChar.unicodeSimbolConvert()
        print(resultLabel.text!)
    }
////
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pikers()

        
        
        
        
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

