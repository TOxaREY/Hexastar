import UIKit
import Foundation
//decimal to oct
var inputDecDouble = Double()
inputDecDouble = 1515.55514
var inputDecInt = UInt64(inputDecDouble)
var countDecInt = String(inputDecInt).count
var countFrac = 50 - countDecInt
var y = 0
var inputDecFrac = inputDecDouble - Double(inputDecInt)
var outputOct = String()
var outputOctFrac = String()
var outOctTotal = String()

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
        return octStringTempRev.flatMap{String($0)}.joined()
    }
if inputDecInt > 0 {
    outputOct.append(decOctConv())
} else {
    outputOct = "0"
}

// Frag
func decOctFracConv() -> (String) {
     var octArrayFracTemp = [Int]()
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
    return octArrayFracTemp.flatMap{String($0)}.joined()
}
outputOctFrac = decOctFracConv()

outOctTotal = outputOct + "." + outputOctFrac
//print(outOctTotal)


//oct to decimal
var inputOctString = "177456.25310"
var outputDec = String()

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

var decArrayIntTempRev = Array(decArrayIntTemp.reversed())
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

outputDec = octDecConv()
print(outputDec)




