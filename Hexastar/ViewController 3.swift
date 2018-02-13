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

    @IBOutlet weak var picker1: UIPickerView!
    var pickerData: [[String]] = [[String]]()
    func piker() {
        pickerData = [["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"], ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"], ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"], ["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"],["0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"]]
        self.picker1.delegate = self
        self.picker1.dataSource = self
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        piker()
        
        
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
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

