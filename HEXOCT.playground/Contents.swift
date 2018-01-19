import UIKit
import Foundation
//hex to decimal
var hexStr = "111111ABCDEFEDCB"
func decimalConv() -> (String) {
    var hexArray = [Character]()
    var hexArrayInt = [UInt64]()
    var decimal = [UInt64]()
    for char in hexStr {
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
        decimal.append(decArr[i] * UInt64(pow(16, Double(i))))
    }
    return String(Int(decimal.reduce(0, +)))
}
var hexDec = decimalConv()



var myUni = UInt64(hexDec)!
var multiUni = String()
func octConv() -> (String) {
    var oct = [Int]()
    while myUni > 0 {
        switch myUni % 8 {
        case 7 : oct.append(7)
        case 6 : oct.append(6)
        case 5 : oct.append(5)
        case 4 : oct.append(4)
        case 3 : oct.append(3)
        case 2 : oct.append(2)
        case 1 : oct.append(1)
        case 0 : oct.append(0)
        default: break
        }
        myUni = myUni / 8
    }
    let octRev = Array(oct.reversed())
    return octRev.flatMap{String($0)}.joined()
}
if myUni > 0 {
    multiUni.append(octConv())
} else {
    multiUni = "0"
}
//print(multiUni)


var octStr = "17745625310"
func decimalConv2() -> (String) {
    var octArray = [Character]()
    var octArrayInt = [UInt64]()
    var decimal = [UInt64]()
    for char in octStr {
        octArray.append(char)
    }
    for i in octArray {
        switch i {
        case "7" : octArrayInt.append(7)
        case "6" : octArrayInt.append(6)
        case "5" : octArrayInt.append(5)
        case "4" : octArrayInt.append(4)
        case "3" : octArrayInt.append(3)
        case "2" : octArrayInt.append(2)
        case "1" : octArrayInt.append(1)
        case "0" : octArrayInt.append(0)
        default: break
        }
    }
    var decArr = Array(octArrayInt.reversed())
    for i in 0...decArr.count - 1 {
        decimal.append(decArr[i] * UInt64(pow(8, Double(i))))
    }
    return String(Int(decimal.reduce(0, +)))
}


var myUni2 = UInt64(decimalConv2())!
var multiUni2 = String()
func hexConv2() -> (String) {
     var hex2 = String()
while myUni2 > 0 {
        switch myUni2 % 16 {
    case 16 : hex2.append("10")
    case 15 : hex2.append("F")
    case 14 : hex2.append("E")
    case 13 : hex2.append("D")
    case 12 : hex2.append("C")
    case 11 : hex2.append("B")
    case 10 : hex2.append("A")
    case 9 : hex2.append("9")
    case 8 : hex2.append("8")
    case 7 : hex2.append("7")
    case 6 : hex2.append("6")
    case 5 : hex2.append("5")
    case 4 : hex2.append("4")
    case 3 : hex2.append("3")
    case 2 : hex2.append("2")
    case 1 : hex2.append("1")
    case 0 : hex2.append("0")
default: break
}
        myUni2 = myUni2 / 16
  }
        let hexRev2 = Array(hex2.reversed())
        return hexRev2.flatMap{String($0)}.joined()
    }
if myUni2 > 0 {
    multiUni2.append(hexConv2())
} else {
    multiUni2 = "0"
}
print(multiUni2)





