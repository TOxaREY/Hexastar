import UIKit
import Foundation
var myUni = UInt64()
var multiUni = String()
var printStringHex = String()
myUni = 9999999999999999999
func hexConv() -> (String) {
     var hex = String()
while myUni > 0 {
        switch myUni % 16 {
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
        myUni = myUni / 16
  }
        let hexRev = Array(hex.reversed())
        return hexRev.flatMap{String($0)}.joined()
    }
if myUni > 0 {
    multiUni.append(hexConv())
} else {
    multiUni = "0"
}
print(multiUni)
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
print(decimalConv())



