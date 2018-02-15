import UIKit
import Foundation
//hex to decimal
var multiUni2 = "U+005E0"
var multiDec = String()
//var multiDecString = String()
//var hexStr = ""
func decimalConv() -> (String) {
var hexArray = [Character]()
var hexArrayInt = [Int]()
var decimal = [Int]()
for char in multiUni2 {
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
//       multiUni2.removeLast()
    if UnicodeScalar(Int(decimal.reduce(0, +))) == nil {
    return ""
    }
    return String(UnicodeScalar(Int(decimal.reduce(0, +)))!)
}
//    hexStr = multiUni2
    multiDec.append(decimalConv())
//    multiDecString = multiDec

//var totalDec = multiDecString
print(multiDec)


