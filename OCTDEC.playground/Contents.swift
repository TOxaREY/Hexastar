import UIKit
import Foundation
var myUni = UInt64()
var multiUni = String()
myUni = 1358469871
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
print(multiUni)
//oct to decimal
var octStr = "17745625310"
func decimalConv() -> (String) {
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
print(decimalConv())




