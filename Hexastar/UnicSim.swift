//
//  UnicSim.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 14.02.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit
import Foundation

class UnicodeCharacterConverter {
    private var _inputUnicode:String = ""
    var inputUnicode:String {
        get {
            return _inputUnicode
        } set {
            _inputUnicode = newValue
        }
    }
    func unicodeSimbolConvert() -> String {
        var multiDec = String()
        func decimalConv() -> (String) {
            var hexArray = [Character]()
            var hexArrayInt = [Int]()
            var decimal = [Int]()
            for char in inputUnicode {
                hexArray.append(char)
            }
            for i in hexArray {
                switch i {
                case "F" : hexArrayInt.append(15)
                case "E" : hexArrayInt.append(14)
                case "D" : hexArrayInt.append(13)
                case "C" : hexArrayInt.append(12)
                case "B" : hexArrayInt.append(11)
                case "A" : hexArrayInt.append(10)
                case "9" : hexArrayInt.append(9)
                case "8" : hexArrayInt.append(8)
                case "7" : hexArrayInt.append(7)
                case "6" : hexArrayInt.append(6)
                case "5" : hexArrayInt.append(5)
                case "4" : hexArrayInt.append(4)
                case "3" : hexArrayInt.append(3)
                case "2" : hexArrayInt.append(2)
                case "1" : hexArrayInt.append(1)
                case "0" : hexArrayInt.append(0)
                default: break
                }
            }
            var decArr = Array(hexArrayInt.reversed())
            for i in 0...decArr.count - 1 {
                decimal.append(decArr[i] * Int(pow(16, Double(i))))
            }
            if UnicodeScalar(Int(decimal.reduce(0, +))) == nil {
                return ""
            }
            return String(UnicodeScalar(Int(decimal.reduce(0, +)))!)
        }
            multiDec.append(decimalConv())
            return multiDec
     }
}
