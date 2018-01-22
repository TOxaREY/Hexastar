import UIKit
import Foundation
//decimal to hex
var inputDecDouble = Double()
inputDecDouble = 1515.55514
var inputDecInt = UInt64(inputDecDouble)
var countDecInt = String(inputDecInt).count
var countFrac = 50 - countDecInt
var y = 0
var inputDecFrac = inputDecDouble - Double(inputDecInt)
var outputHex = String()
var outputHexFrac = String()
var outHexTotal = String()

func decHexConv() -> (String) {
     var hexStringTemp = String()
while inputDecInt > 0 {
        switch inputDecInt % 16 {
    case 16 : hexStringTemp.append("10")
    case 15 : hexStringTemp.append("F")
    case 14 : hexStringTemp.append("E")
    case 13 : hexStringTemp.append("D")
    case 12 : hexStringTemp.append("C")
    case 11 : hexStringTemp.append("B")
    case 10 : hexStringTemp.append("A")
    case 9 : hexStringTemp.append("9")
    case 8 : hexStringTemp.append("8")
    case 7 : hexStringTemp.append("7")
    case 6 : hexStringTemp.append("6")
    case 5 : hexStringTemp.append("5")
    case 4 : hexStringTemp.append("4")
    case 3 : hexStringTemp.append("3")
    case 2 : hexStringTemp.append("2")
    case 1 : hexStringTemp.append("1")
    case 0 : hexStringTemp.append("0")
default: break
}
        inputDecInt = inputDecInt / 16
  }
        let hexStringTempRev = Array(hexStringTemp.reversed())
        return hexStringTempRev.flatMap{String($0)}.joined()
    }
if inputDecInt > 0 {
    outputHex.append(decHexConv())
} else {
    outputHex = "0"
}

// Frac
func decHexFracConv() -> (String) {
   var hexStringFracTemp = String()
    while inputDecFrac != 0 && y != countFrac {
        switch UInt64(inputDecFrac * 16) {
        case 16 : hexStringFracTemp.append("10")
        case 15 : hexStringFracTemp.append("F")
        case 14 : hexStringFracTemp.append("E")
        case 13 : hexStringFracTemp.append("D")
        case 12 : hexStringFracTemp.append("C")
        case 11 : hexStringFracTemp.append("B")
        case 10 : hexStringFracTemp.append("A")
        case 9 : hexStringFracTemp.append("9")
        case 8 : hexStringFracTemp.append("8")
        case 7 : hexStringFracTemp.append("7")
        case 6 : hexStringFracTemp.append("6")
        case 5 : hexStringFracTemp.append("5")
        case 4 : hexStringFracTemp.append("4")
        case 3 : hexStringFracTemp.append("3")
        case 2 : hexStringFracTemp.append("2")
        case 1 : hexStringFracTemp.append("1")
        case 0 : hexStringFracTemp.append("0")
        default: break
        }
        y += 1
        inputDecFrac = inputDecFrac * 16 - Double(UInt64(inputDecFrac * 16))
    }
    return hexStringFracTemp
}
outputHexFrac = decHexFracConv()

outHexTotal = outputHex + "." + outputHexFrac
//print(outHexTotal)

//hex to decimal
var inputHexString = "FFFFFFFFFFF.FF"
var outputDec = String()

func hexDecConv() -> (String) {
var decArrayChar = [Character]()
var decArrayIntTemp = [UInt64]()
var decArrayDouble = [Double]()
var indexString = 0
var indexDotta = 0
var z = 0
for char in inputHexString {
    indexString += 1
    if char == "." {
       indexDotta = indexString
    }
    decArrayChar.append(char)
}
for i in decArrayChar {
    switch i {
    case "F" : decArrayIntTemp.append(15)
    case "E" : decArrayIntTemp.append(14)
    case "D" : decArrayIntTemp.append(13)
    case "C" : decArrayIntTemp.append(12)
    case "B" : decArrayIntTemp.append(11)
    case "A" : decArrayIntTemp.append(10)
    case "9" : decArrayIntTemp.append(9)
    case "8" : decArrayIntTemp.append(8)
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
var decArrayIntTempRev = Array(decArrayIntTemp.reversed())
    if indexDotta != 0 {
z = indexDotta - decArrayChar.count
    } else {
        z = 0
    }
for i in 0...decArrayIntTempRev.count - 1 {
    decArrayDouble.append(Double(decArrayIntTempRev[i]) * pow(16, Double(z)))
    z += 1
}
    if indexDotta != 0 {
        return String(decArrayDouble.reduce(0, +))
    } else {
       return String(UInt64(decArrayDouble.reduce(0, +)))
    }
}
    outputDec = hexDecConv()

print(outputDec)

