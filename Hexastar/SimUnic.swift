//
//  SimUnic.swift
//  Hexastar
//
//  Created by REYNIKOV ANTON on 12.02.2018.
//  Copyright © 2018 REYNIKOV ANTON. All rights reserved.
//

import UIKit
import Foundation

class CharacterUnicodeConverter {
    private var _inputCharacter:String = ""
    var inputCharacter:String {
        get {
            return _inputCharacter
        } set {
            _inputCharacter = newValue
        }
      }
    func simbolUnicodeConvert() -> String {
    var myString = inputCharacter
    var myUni = [UInt32]()
    var myUnic = [UInt32]()
    var multiUni = [String]()
    var printStringHex = String()
    var printStringArray = [String]()
    for i in myString.unicodeScalars {
    myUnic.append(i.value)
    }
    myUni = myUnic.reversed()
    func hexConv() -> (String) {
        var last = UInt32(myUni.last!)
        var hex = [String]()
        while last > 0 {
            switch last % 16 {
            case 16 : hex.append("10")
            case 15 : hex.append("F")
            case 14 : hex.append("E")
            case 13 : hex.append("D")
            case 12 : hex.append("C")
            case 11 : hex.append("B")
            case 10 : hex.append("A")
            case 9 : hex.append("9")
            case 8 : hex.append("8")
            case 7 : hex.append("7")
            case 6 : hex.append("6")
            case 5 : hex.append("5")
            case 4 : hex.append("4")
            case 3 : hex.append("3")
            case 2 : hex.append("2")
            case 1 : hex.append("1")
            case 0 : hex.append("0")
            default: break
            }
            last = last / 16
        }
        myUni.removeLast()
        let hexRev = Array(hex.reversed())
        return hexRev.flatMap{String($0)}.joined()
    }
    while myUni.count > 0 {
    multiUni.append(hexConv())
    }
    for i in multiUni {
    printStringHex.append("U+\(i) ")
    }
    return printStringHex
    }
}
