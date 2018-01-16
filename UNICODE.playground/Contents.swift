import UIKit
import Foundation
let myString = "-"
var myUni = [UInt32]()
var myUnic = [UInt32]()
var multiUni = [String]()
var printStringHex = String()
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
//for i in multiUni {
//    printStringHex.append("U+\(i) ")
//}
//print(printStringHex)
//hex to decimal
multiUni = ["1F1FA","1F1E6"]
var multiDec = [String]()
var multiDecString = [String]()
var hexStr = ""
func decimalConv() -> (String) {
var hexArray = [Character]()
var hexArrayInt = [Int]()
var decimal = [Int]()
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
    decimal.append(decArr[i] * Int(pow(16, Double(i))))
}
       multiUni.removeLast()
    return String(UnicodeScalar(Int(decimal.reduce(0, +)))!)
}
while multiUni.count > 0 {
    hexStr = multiUni[multiUni.count - 1]
    multiDec.append(decimalConv())
}
multiDecString = multiDec.reversed()
var totalDec = multiDecString.reduce("", +)
print(totalDec)


