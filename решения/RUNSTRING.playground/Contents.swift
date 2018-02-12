//: Playground - noun: a place where people can play

import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
func runStringArray(string:String) -> ([String]) {
    let myString = string
    var myStringAdd = myString
    var newString:String
    var substring:Substring
    var arrayRunString = [String]()
    myStringAdd.append(String(myString[myString.index(myString.startIndex, offsetBy: 0)..<myString.index(myString.startIndex, offsetBy: 5)]))
    var countString = 0
    for _ in myString {
        countString += 1
    }
    for i in 0...countString - 1 {
        substring = myStringAdd[myStringAdd.index(myStringAdd.startIndex, offsetBy: i)..<myStringAdd.index(myStringAdd.startIndex, offsetBy: i + 5)]
        newString = String(substring)
        arrayRunString.append(newString)
    }
    return arrayRunString
}
func runString(string:String) {
    let count = runStringArray(string: string).count
    var q = 0
    _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
        print(runStringArray(string: string)[q])
        q += 1
        if q >= count {
            q = 0
        }
    }
}
runString(string: "dvjknsdvnsdvnsdvnsd")

