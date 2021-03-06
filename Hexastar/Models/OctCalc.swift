//
//  OctCalc.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 25.01.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit
import Foundation

class DecOctCalc {
    private var _inputDecString:String = ""
    var inputDecString:String {
        get {
            return _inputDecString
        } set {
            _inputDecString = newValue
        }
    }
    func decOctFuncTotal() -> (String) {
        var inputDecDouble:Double = Double(inputDecString)!
        var inputDecInt:UInt64 = UInt64(inputDecDouble)
        func decOctConv() -> (String) {
            var octArrayTemp = [Int]()
            while inputDecInt > 0 {
                switch inputDecInt % 8 {
                case 7 : octArrayTemp.append(7)
                case 6 : octArrayTemp.append(6)
                case 5 : octArrayTemp.append(5)
                case 4 : octArrayTemp.append(4)
                case 3 : octArrayTemp.append(3)
                case 2 : octArrayTemp.append(2)
                case 1 : octArrayTemp.append(1)
                case 0 : octArrayTemp.append(0)
                default: break
                }
                inputDecInt = inputDecInt / 8
            }
            let octStringTempRev = Array(octArrayTemp.reversed())
            return octStringTempRev.compactMap{String($0)}.joined()
        }
        func outputOctFunc() -> (String) {
            var outputOct = String()
            if inputDecInt > 0 {
                outputOct.append(decOctConv())
            } else {
                outputOct = "0"
            }
            return outputOct
        }
        func decOctFracConv() -> (String) {
            var octArrayFracTemp = [Int]()
            let countDecInt = String(inputDecInt).count
            let countFrac = 50 - countDecInt
            var y = 0
            var inputDecFrac = inputDecDouble - Double(inputDecInt)
            while inputDecFrac != 0 && y != countFrac {
                switch UInt64(inputDecFrac * 8) {
                case 7 : octArrayFracTemp.append(7)
                case 6 : octArrayFracTemp.append(6)
                case 5 : octArrayFracTemp.append(5)
                case 4 : octArrayFracTemp.append(4)
                case 3 : octArrayFracTemp.append(3)
                case 2 : octArrayFracTemp.append(2)
                case 1 : octArrayFracTemp.append(1)
                case 0 : octArrayFracTemp.append(0)
                default: break
                }
                y += 1
                inputDecFrac = inputDecFrac * 8 - Double(UInt64(inputDecFrac * 8))
            }
            return octArrayFracTemp.compactMap{String($0)}.joined()
        }
        let outputOctFrac = decOctFracConv()
        let outputOctInt = outputOctFunc()
        var outOctTotal  = String()
        if outputOctFrac.count != 0 {
            outOctTotal = outputOctInt + "." + outputOctFrac
        } else {
            outOctTotal = outputOctInt
        }
        return outOctTotal
    }
}
class OctDecCalc {
    private var _inputOctString:String = ""
    var inputOctString:String {
        get {
            return _inputOctString
        } set {
            _inputOctString = newValue
        }
    }
    func octDecConv() -> (String) {
        var decArrayChar = [Character]()
        var decArrayIntTemp = [UInt64]()
        var decArrayDouble = [Double]()
        var indexString = 0
        var indexDotta = 0
        var z = 0
        for char in inputOctString {
            indexString += 1
            if char == "." {
                indexDotta = indexString
            }
            decArrayChar.append(char)
        }
        for i in decArrayChar {
            switch i {
            case "7" : decArrayIntTemp.append(7)
            case "6" : decArrayIntTemp.append(6)
            case "5" : decArrayIntTemp.append(5)
            case "4" : decArrayIntTemp.append(4)
            case "3" : decArrayIntTemp.append(3)
            case "2" : decArrayIntTemp.append(2)
            case "1" : decArrayIntTemp.append(1)
            case "0" : decArrayIntTemp.append(0)
            default: break
            }
        }
        
        let decArrayIntTempRev = Array(decArrayIntTemp.reversed())
        if indexDotta != 0 {
            z = indexDotta - decArrayChar.count
        } else {
            z = 0
        }
        for i in 0...decArrayIntTempRev.count - 1 {
            decArrayDouble.append(Double(decArrayIntTempRev[i]) * pow(8, Double(z)))
            z += 1
        }
        if indexDotta != 0 {
            return String(decArrayDouble.reduce(0, +))
        } else {
            return String(UInt64(decArrayDouble.reduce(0, +)))
        }
    }
}






